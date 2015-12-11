package com.kosign.wecafe.services;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosign.wecafe.entities.Order;
import com.kosign.wecafe.entities.Pagination;
import com.kosign.wecafe.entities.Sale;
import com.kosign.wecafe.util.HibernateUtil;

@Service
public class SellServiceImpl implements SellService{

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<Map> getSellAllList(Pagination pagination) {
		
		Session session = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			session.getTransaction().begin();
			//Query query = session.createQuery("From Sale");
			Query query = session.createQuery("SELECT new Map(S.saleId AS ID, S.totalAmount AS TOTAL, S.saleDatetime AS SALE_DATE, S.user.username AS SELLER, S.order.orderId AS ORDER_ID) FROM Sale S");
			query.setMaxResults(pagination.getCurrentPage()*pagination.getPerPage());
			query.setFirstResult((pagination.previousPage())*pagination.getPerPage());
			List<Map> sales= (List<Map>)query.list();
			session.getTransaction().commit();
			return sales;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return null;
	}
	
	@Override
	public List<Map<String, Object>> getDetailSellProduct(long id) {
		Session session = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			session.getTransaction().begin();
			
			Query query = session.createQuery("SELECT new Map(Product.productName AS productName, "
											+ "Product.salePrice as SalePrice, "
											+ "OD.proQty as ProQty, "
											+ "OD.proUnitPrice as ProUnitPrrice, "
											+ "OD.proComment as ProComment, "
											+ "order.orderDate as orderDate) "
											+ "FROM OrderDetail AS OD "
											+ "INNER JOIN OD.pk.product As Product "
											+ "INNER JOIN OD.pk.product.category AS Category "
											+ "INNER JOIN OD.pk.order AS order  "
											+ "Where OD.pk.order.orderId = ?");
			
			
			query.setParameter(0, id);
			List<Map<String, Object>> products = (List<Map<String, Object>>)query.list();
			session.getTransaction().commit();
			return products;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
			
		}finally {
			session.close();
		}
		return null;
	}
	
	public List<Order> getAllOrders() {
		Session session = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			session.getTransaction().begin();
			
			Query query = session.createQuery("FROM Order "
											+ "WHERE status = 1 ORDER BY orderDate");
			
			List<Order> orders = (List<Order>)query.list();
			
			for(Order order: orders){
				System.out.println(order.getCustomer());
				//System.out.println(order.getOrderAmount());
			}
			return orders;
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return null;
	}
	
	@Override
	public Long getAllSellCount() {
		Session session = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			session.getTransaction().begin();
			return (Long) session.createCriteria(Sale.class).setProjection(Projections.rowCount()).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return new Long(0);
	}
	
	@Transactional
	@Override
	public List<Map<String, Object>> getAllSaleDailyReports() {
		Session session = null;
		try {
			session = sessionFactory.getCurrentSession();
			SQLQuery query = 
					session.createSQLQuery(
							"SELECT daily_sale.pro_name " +
							"     , daily_sale.col_1 " +
							"     , daily_sale.col_2 " +
							"     , daily_sale.col_3 " +
							"     , daily_sale.col_4 " +
							"     , daily_sale.col_5 " +
							"     , daily_sale.col_6 " +
							"     , daily_sale.col_7 " +
						    "FROM crosstab('SELECT product.pro_name"
						    + "                  , A.sale_datetime"
						    + "					 , A.qty " + 
							"				FROM product " +
							"				LEFT JOIN( " +
							"					SELECT order_detail.pro_id " +
							"					     , sale_datetime::date " +
							"						 , SUM(COALESCE(order_detail.pro_qty,0)) AS qty " +
							"					FROM sale " + 
							"					LEFT JOIN wecafe_order ON sale.ord_id = wecafe_order.order_id " +
							"					LEFT JOIN order_detail ON wecafe_order.order_id = order_detail.order_id AND wecafe_order.status=2 " +
							"					WHERE sale_datetime::date BETWEEN ''2015-12-01'' AND ''2015-12-07'' " +
							"					GROUP BY 1, 2 " +
							"					ORDER BY 2 " +
							"				) A " +
							"				ON product.pro_id = A.pro_id' , " +
							"				'SELECT period::date " +
							"				FROM generate_series(''2015-12-01''::date,''2015-12-07'', ''1 day'' ) AS period;') " +
							"				AS daily_sale (pro_name TEXT, " +
							"				col_1 INTEGER, " +
							"				col_2 INTEGER, " +
							"				col_3 INTEGER, " +
							"				col_4 INTEGER, " +
							"				col_5 INTEGER, " +
							"				col_6 INTEGER, " +
							"				col_7 INTEGER); "			); 					
			List<Map<String, Object>> sales= (List<Map<String, Object>>)query.list();
			return sales;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	@Override
	public List<Map<String, Object>> getAllSaleWeeklyReports() {
		// TODO Auto-generated method stub
		return null;
	}
		
	@Transactional
	@Override
	public List<Map<String, Object>> getAllSaleMonthlyReports() {
		Session session = null;
		try {
			session = sessionFactory.getCurrentSession();
			SQLQuery query = 
					session.createSQLQuery("SELECT " +
										   "	mthreport.row_name [ 1 ] AS customer, " +
										   "	mthreport.row_name [ 2 ] AS product, " +
										   "	COALESCE(jan[1],0) AS JAN_QTY, " +
										   "	COALESCE(jan[2],0) AS JAN_AMOUNT, " +
										   "	COALESCE(feb[1],0) AS FEB_QTY, " + 
										   "	COALESCE(feb[2],0) AS FEB_AMOUNT, " +
										   "	COALESCE(mar[1],0) AS MAR_QTY, " +
										   "	COALESCE(mar[2],0) AS MAR_AMOUNT, " +
										   "	COALESCE(apr[1],0) AS APR_QTY, " +
										   "	COALESCE(apr[2],0) AS APR_AMOUNT, " +
										   "	COALESCE(may[1],0) AS MAY_QTY, " +
										   "	COALESCE(may[2],0) AS MAY_AMOUNT, " +
										   "	COALESCE(jun[1],0) AS JUN_QTY, "+
										   "	COALESCE(jun[2],0) AS JUN_AMOUNT, " +
										   "	COALESCE(jul[1],0) AS JUL_QTY, " +
										   "	COALESCE(jul[2],0) AS JUL_AMOUNT, " +
										   "	COALESCE(aug[1],0) AS AUG_QTY, " +
										   "	COALESCE(aug[2],0) AS AUG_AMOUNT, " +
										   "	COALESCE(sep[1],0) AS SEP_QTY, " +
										   "	COALESCE(sep[2],0) AS SEP_AMOUNT, " +
										   "	COALESCE(oct[1],0) AS OCT_QTY, " +
										   "	COALESCE(oct[2],0) AS OCTR_AMOUNT, " +
										   "	COALESCE(nov[1],0) AS NOV_QTY, " +
										   "	COALESCE(nov[2],0) AS NOV_AMOUNT, " +
										   "	COALESCE(DEC[1],0) AS DEC_QTY, " +
										   "	COALESCE(DEC[2],0) AS DEC_AMOUNT " +
										   "FROM " +
										   "	crosstab ( " +
										   "	'SELECT ARRAY[users.lastname::text, product.pro_name::text] As row_name " +
										   "		   ,to_char(import.imp_date, ''mon'')::text As imp_date " +
										   "		   ,ARRAY[SUM(import_detail.pro_qty), SUM(import_detail.unit_price*import_detail.pro_qty)] AS row " +
										   "	 FROM product " +
										   "	 LEFT JOIN import_detail ON product.pro_id = import_detail.pro_id " +
										   "	 LEFT JOIN import ON import.imp_id = import_detail.imp_id AND date_trunc(''year'',import.imp_date) = date_trunc(''year'',''2015-01-01''::TIMESTAMP) " +   
										   "	 LEFT JOIN users ON import.user_id = users.id " +
										   "	 GROUP BY 1,2 " +
										   "	 ORDER BY 2', " +
										   "'SELECT to_char(date ''2015-01-01'' + (n || '' month'')::interval, ''mon'') As short_mname " +  
										   " FROM generate_series(0,11) n' " +
										   ") AS mthreport ( " +
										   "row_name TEXT [], " +
										   "jan INTEGER[], " +
										   "feb INTEGER[], " +
										   "mar INTEGER[], " +
										   "apr INTEGER[], " +
										   "may INTEGER[], " +
										   "jun INTEGER[], " +
										   "jul INTEGER[], " +
										   "aug INTEGER[], " +
										   "sep INTEGER[], " +
										   "oct INTEGER[], " +
										   "nov INTEGER[], " +
										   "dec INTEGER[]) " +
										   "ORDER BY product;"); 	
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			List<Map<String, Object>> sales= (List<Map<String, Object>>)query.list();
			return sales;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	@Override
	public List<Map<String, Object>> getAllSaleYearlyReports() {
		// TODO Auto-generated method stub
		return null;
	}
		
}
