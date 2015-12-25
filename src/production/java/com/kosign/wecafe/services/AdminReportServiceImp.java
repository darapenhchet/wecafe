package com.kosign.wecafe.services;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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

import com.kosign.wecafe.entities.ImportProduct;
import com.kosign.wecafe.forms.DateForm;
import com.kosign.wecafe.util.HibernateUtil;

@Service
public class AdminReportServiceImp implements AdminReportService {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Map> getReportListAllSellProduct() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery(
					"SELECT new Map(O.pk.product.productId As prouductID " 
									+ ", O.pk.product.productName as productName "
									+ ", SUM(O.proQty) As proQty "
									+ ", O.proUnitPrice As UnitPrice "
									+ ", SUM(O.proQty * O.proUnitPrice) as Total)"
						+ " FROM OrderDetail O " 
						+ " INNER JOIN O.pk.order " 
						+ " INNER JOIN O.pk.order.sale "
						+ " Where O.pk.order.sale.saleDatetime BETWEEN :startDate AND :endDate "
						+ " and O.pk.order.status = 2 "
						+ " GROUP BY  O.pk.product.productId, O.pk.product.productName, O.proUnitPrice");

			// query.setParameter("orderId", new Long(94));
			SimpleDateFormat dateformat3 = new SimpleDateFormat("dd/MM/yyyy");
			Date date1 = dateformat3.parse("26/10/2015");
			Date date2 = dateformat3.parse("29/11/2015");
			query.setParameter("startDate", date1);
			query.setParameter("endDate", date2);
			List<Map> products = (ArrayList<Map>) query.list();
			System.out.println("products.size()" + products.size());
 
			return products;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}

		return null;
	}

	@Override
	public List<Map> getReportListAllOrderProduct() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			/*Query query = session.createQuery(
					"SELECT new Map(O.pk.product.productId As prouductID " 
									+ ", O.pk.product.productName as productName "
									+ ", SUM(O.proQty) As proQty "
									+ ", O.proUnitPrice As UnitPrice "
									+ ", SUM(O.proQty * O.proUnitPrice) as Total)"
						+ " FROM OrderDetail O " 
						+ " INNER JOIN O.pk.order " 
						+ " INNER JOIN O.pk.order.sale "
						+ " Where O.pk.order.sale.saleDatetime BETWEEN :startDate AND :endDate "
						+ " and O.pk.order.status = 1 "
						+ " GROUP BY  O.pk.product.productId, O.pk.product.productName, O.proUnitPrice");

			*/
		
			Query query = session.createQuery("Select new Map("
					+ "p.productName as proname,"
					+ "SUM(impdetail.proQty) as proqty,"
					+ "impdetail.unitPrice as prounitprice,"
				//	+ "impdetail.supplier.supplierName as supname, "
					+ " SUM(impdetail.proQty * impdetail.unitPrice) as Total)"
					+ " FROM ImportDetail impdetail" 
					+ " INNER JOIN impdetail.pk1.product p"
					+ " GROUP BY p.productName, impdetail.unitPrice ");
			// query.setParameter("orderId", new Long(94));
//			SimpleDateFormat dateformat3 = new SimpleDateFormat("dd/MM/yyyy");
//			 Date date1 = dateformat3.parse("26/10/2015");
//			 Date date2 = dateformat3.parse("29/11/2015");
//			query.setParameter("startDate", date1);
//			query.setParameter("endDate", date2);
			List<Map> products = (ArrayList<Map>) query.list();
			System.out.println("products.size()" + products.size());
//			for (Map product : products) {
//				System.out.println("productName" + product.get("productName"));
//				System.out.println("prouductID " + product.get("prouductID"));
//				System.out.println("proQty " + product.get("proQty"));
//				System.out.println("UnitPrice " + product.get("UnitPrice"));
//				System.out.println("Total" + product.get("Total"));
//			}
			return products;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Map> getSearchSellbyDate(DateForm dateForm) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery(
					"SELECT new Map(O.pk.product.productId As prouductID " 
									+ ", O.pk.product.productName as productName "
									+ ", SUM(O.proQty) As proQty "
									+ ", O.proUnitPrice As UnitPrice "
									+ ", SUM(O.proQty * O.proUnitPrice) as Total)"
						+ " FROM OrderDetail O " 
						+ " INNER JOIN O.pk.order " 
						+ " INNER JOIN O.pk.order.sale "
						+ " Where O.pk.order.sale.saleDatetime BETWEEN :startDate AND :endDate "
						+ " and O.pk.order.status = 2 "
						+ " GROUP BY  O.pk.product.productId, O.pk.product.productName, O.proUnitPrice");

			// query.setParameter("orderId", new Long(94));
			SimpleDateFormat dateformat3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date startdate = dateformat3.parse(dateForm.getStartdate());
			Date enddate = dateformat3.parse(dateForm.getEnddate());
			query.setParameter("startDate", startdate);
			query.setParameter("endDate", enddate);
			List<Map> products = (ArrayList<Map>) query.list();
			System.out.println("products.size()" + products.size());
//			for (Map product : products) {
//				System.out.println("productName" + product.get("productName"));
//				System.out.println("prouductID " + product.get("prouductID"));
//				System.out.println("proQty " + product.get("proQty"));
//				System.out.println("UnitPrice " + product.get("UnitPrice"));
//				System.out.println("Total" + product.get("Total"));
//			}
			
			System.out.println("=======================================" + query );
			return products;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}

		return null;
	}

	@Override
	public List<Map> getSearchOrderbyDate(DateForm dateForm) { 
		

		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			/*Query query = session.createQuery(
					"SELECT new Map(O.pk.product.productId As prouductID " 
									+ ", O.pk.product.productName as productName "
									+ ", SUM(O.proQty) As proQty "
									+ ", O.proUnitPrice As UnitPrice "
									+ ", SUM(O.proQty * O.proUnitPrice) as Total)"
						+ " FROM OrderDetail O " 
						+ " INNER JOIN O.pk.order " 
						+ " INNER JOIN O.pk.order.sale "
						+ " Where O.pk.order.sale.saleDatetime BETWEEN :startDate AND :endDate "
						+ " and O.pk.order.status = 1 "
						+ " GROUP BY  O.pk.product.productId, O.pk.product.productName, O.proUnitPrice");						


			*/
//			SELECT pd.pro_id, pd.imp_id, pd.pro_qty, pd.pro_status, pd.sup_id, pd.unit_price from import_detail pd INNER JOIN import p on pd.imp_id = p.imp_id where p.imp_date = '2015-11-13'
			
			Query query = session.createQuery("Select new Map("
					+ "p.productName as proname,"
					+ "SUM(impdetail.proQty) as proqty,"
					+ "impdetail.unitPrice as prounitprice,"
				//	+ "impdetail.supplier.supplierName as supname, "
					+ " SUM(impdetail.proQty * impdetail.unitPrice) as Total)"
					+ " FROM ImportDetail impdetail" 
					+ " Inner join impdetail.pk1.importProduct imppro"
					+ " INNER JOIN impdetail.pk1.product p"
					+ " Where imppro.impDate BETWEEN :startDate AND :endDate "
					+ " GROUP BY p.productName, impdetail.unitPrice ");
			 // query.setParameter("orderId", new Long(94));
			
			SimpleDateFormat dateformat3 = new SimpleDateFormat("yyyy-MM-dd");
			Date startdate = dateformat3.parse(dateForm.getStartdate());
			Date enddate = dateformat3.parse(dateForm.getEnddate());
			query.setParameter("startDate", startdate);
			query.setParameter("endDate", enddate); 
			List<Map> products = (ArrayList<Map>) query.list();
			System.out.println("products.size()" + products.size());
//			for (Map product : products) {
//				System.out.println("productName" + product.get("productName"));
//				System.out.println("prouductID " + product.get("prouductID"));
//				System.out.println("proQty " + product.get("proQty"));
//				System.out.println("UnitPrice " + product.get("UnitPrice"));
//				System.out.println("Total" + product.get("Total"));
//			}
			return products;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	@Transactional
	public List<Map> getListReportDetailPurchase() {
		Session session = null;
		try{
			session = sessionFactory.getCurrentSession();
			session.getTransaction().begin();
			SQLQuery query = session.createSQLQuery(
					"SELECT A.imp_id AS purchase_id "
				 + "   , A.imp_date AS purchase_date "
				 + "	   , CONCAT(C.lastname, ' ', C.firstname) AS purchase_by "
				 + "	   , SUM(pro_qty * unit_price) AS purchase_total_amount "
				 + "	   , '0' AS purchase_type "
				 + "	FROM import A "
				 + "	INNER JOIN import_detail B ON A.imp_id = B.imp_id "
				 + "	LEFT JOIN users C ON C.id = A.user_id "
				 + "	WHERE EXTRACT(YEAR FROM A.imp_date) = 2015 "
				 + "	GROUP BY 1,2,3 " 
				 + "	UNION ALL "
				 + "	SELECT A.expense_id AS purchase_id "
					+ "   , A.expense_date AS purchase_date "
				+ "	   , CONCAT(C.lastname, ' ', C.firstname) AS purchase_by "
				+ "	   , SUM(B.expense_qty * B.expense_unitprice) AS purhcase_total_amount "
				+ "	   , '1' AS purchase_type "
				+ "	FROM tbl_expense A "
				+ "	INNER JOIN tbl_expense_detail B ON A.expense_id = B.expense_id "
				+ "	LEFT JOIN users C ON A.expense_user_id = C.id "
							+ "	WHERE EXTRACT(YEAR FROM A.expense_date) = 2015 "
				+ "	GROUP BY 1,2,3 "
				+ "	ORDER BY 2 DESC;");
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			List<Map>	importProducts = (List<Map>)query.list();	
			return importProducts;
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			
		}
		
		return null;
	}
	
	@Override
	@Transactional
	public Long count(){
		Session session = null;
		try{
			session = sessionFactory.getCurrentSession();
			return (Long) session.createCriteria(ImportProduct.class).setProjection(Projections.rowCount()).uniqueResult();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return 0L;
	}
	
	@Override
	public List<Object[]> getReportListAllBeverageStock(DateForm dateForm) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			String sql = "select  s.sup_name,p.pro_name, p.qty as carried_over, id.pro_qty as purhase, aa.pro_qty as sales,(p.qty  - aa.pro_qty )as balance "
					+ " from product p"
					+ " left join (select od.pro_qty,od.pro_id, od.order_id,wo.order_date from order_detail od"
					+ " Inner join wecafe_order wo"
					+ " on od.order_id = wo.order_id"
					+ " where wo.status =2 and  wo.order_date BETWEEN '2015-11-07' and '2015-11-19 23:59') as aa"
					+ " on p.pro_id = aa.pro_id "
					+ " left join import_detail id on p.pro_id = id.pro_id"
					+ " left join supplier s on id.sup_id = s.sup_id"
					+ "	GROUP BY p.pro_name, p.qty, id.pro_qty ,  aa.pro_qty, s.sup_name";
			Query query = session.createSQLQuery(sql);
			List<Object[]> result = query.list();
			return result;
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Object[]> getReportListAllCupStockbyDate(DateForm dateForm) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			String sql = "select c.cat_name,p.pro_id,aa.imp_date,p.pro_name, p.qty as carried_over, id.pro_qty as purhase,ta.qty as takeut,(p.qty  - ta.qty) as InStock from product p"
					+ " left join import_detail id on p.pro_id = id.pro_id"
					+ " left join import aa on id.imp_id = aa.imp_id"
					+ " left join  takeout ta on p.pro_id = ta.pro_id"
					+ " inner join category c on p.cat_id = c.cat_id"
					+ " where aa.imp_date BETWEEN '2015-11-30' and '2015-12-03 23:59'"
					+ " GROUP BY p.pro_name, p.qty, id.pro_qty ,   p.pro_id, aa.imp_date, ta.qty,c.cat_name";
			Query query = session.createSQLQuery(sql);
			List<Object[]> result = query.list();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return null;
	}

 


	@Transactional
	@Override
	public List<Map<String, Object>> getListReportMonthlyPurcase(Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		Session session = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		System.out.println(sdf.format(startDate));
		System.out.println(sdf.format(endDate));
		Calendar calStartDate = Calendar.getInstance();
		calStartDate.setTime(startDate);
		
		Calendar calEndDate = Calendar.getInstance();
		calEndDate.setTime(endDate);
		
		Calendar calendar = calStartDate;
		String[] months = new String[]{"jan","feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"};
		StringBuilder sb = new StringBuilder();
		StringBuilder sbSelect = new StringBuilder();
		for(int i=calStartDate.get(Calendar.MONTH) ; i<=calEndDate.get(Calendar.MONTH) ; i++){
			calendar.add(Calendar.MONTH, i);
			System.out.println(months[i]);
			sbSelect.append("COALESCE("+months[i]+"[1],0) AS "+months[i].toUpperCase()+"_QTY ,");
			sbSelect.append("COALESCE("+months[i]+"[2],0) AS "+months[i].toUpperCase()+"_AMOUNT ,");
			sb.append(months[i] + " INTEGER[],");
			
		}
		System.out.println(sb.toString().substring(0, sb.toString().lastIndexOf(",")));
		
		System.out.println(calStartDate.getTime());
		System.out.println(calEndDate.getTime());
		try {
			session = sessionFactory.getCurrentSession();
			SQLQuery query = 
					session.createSQLQuery("SELECT " +
										   "mthreport.row_name [ 1 ] AS customer, " +
										   "mthreport.row_name [ 2 ] AS pro_name, " + 
										   "COALESCE(jan[1],0) AS JAN_QTY, " +
										   "COALESCE(jan[2],0) AS JAN_AMOUNT, " +
										   "COALESCE(feb[1],0) AS FEB_QTY, " +
										   "COALESCE(feb[2],0) AS FEB_AMOUNT, " +
										   "COALESCE(mar[1],0) AS MAR_QTY, " +
										   "COALESCE(mar[2],0) AS MAR_AMOUNT, " +
										   "COALESCE(apr[1],0) AS APR_QTY, " +
										   "COALESCE(apr[2],0) AS APR_AMOUNT, " +
										   "COALESCE(may[1],0) AS MAY_QTY," +
										   "COALESCE(may[2],0) AS MAY_AMOUNT," +
										   "COALESCE(jun[1],0) AS JUN_QTY," +
										   "COALESCE(jun[2],0) AS JUN_AMOUNT," +
										   "COALESCE(jul[1],0) AS JUL_QTY," +
										   "COALESCE(jul[2],0) AS JUL_AMOUNT," +
										   "COALESCE(aug[1],0) AS AUG_QTY," +
										   "COALESCE(aug[2],0) AS AUG_AMOUNT, " +
										   "COALESCE(sep[1],0) AS SEP_QTY, " +
										   "COALESCE(sep[2],0) AS SEP_AMOUNT, " +
										   "COALESCE(oct[1],0) AS OCT_QTY, " +
										   "COALESCE(oct[2],0) AS OCTR_AMOUNT, " +
										   "COALESCE(nov[1],0) AS NOV_QTY, " +
										   "COALESCE(nov[2],0) AS NOV_AMOUNT, " +
										   "COALESCE(DEC[1],0) AS DEC_QTY, " +
										   "COALESCE(DEC[2],0) AS DEC_AMOUNT " +  
										   "FROM " +
										   "	crosstab ( " +
										   "	'SELECT ARRAY[users.lastname::text, product.pro_name::text] As row_name " +
										   "		   ,to_char(import.imp_date, ''mon'')::text As imp_date " +
										   "		   ,ARRAY[SUM(import_detail.pro_qty), SUM(import_detail.unit_price*import_detail.pro_qty)] AS row " +
										   "	 FROM product " +
										   "	 LEFT JOIN import_detail ON product.pro_id = import_detail.pro_id " +
										   "	 LEFT JOIN import ON import.imp_id = import_detail.imp_id AND import.imp_date BETWEEN ''"+sdf.format(startDate)+"'' AND ''"+sdf.format(endDate)+"'' " +   
										   "	 LEFT JOIN users ON import.user_id = users.id " +
										   "	 GROUP BY 1,2 " +
										   "	 ORDER BY 2', " +
										   "'SELECT to_char(date ''"+sdf.format(startDate)+"'' + (n || '' month'')::interval, ''mon'') As short_mname " +  
										   /*" FROM generate_series("+calStartDate.get(Calendar.MONTH)+","+calEndDate.get(Calendar.MONTH)+") n' " +*/
										   " FROM generate_series("+startDate.getMonth()+","+calEndDate.get(Calendar.MONTH)+") n' " +
										   ") AS mthreport ( " +
										   "row_name TEXT [], " + sb.toString().substring(0, sb.toString().lastIndexOf(",")) + ")"
										   /*"jan INTEGER[], " +
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
										   "dec INTEGER[]) " +*/
										   ); 	
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			List<Map<String, Object>> sales= (List<Map<String, Object>>)query.list();
			return sales;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return null;
	}

	@Transactional
	@Override
	public Map<String, Object> getAllPurchaseMonthlyReportsTotal(Date startDate, Date endDate) {
		Session session = null;
		try {
			session = sessionFactory.getCurrentSession();
			SQLQuery query = 
					session.createSQLQuery("SELECT " +
										   "	SUM(COALESCE(jan[1],0)) AS TOTAL_JAN_QTY, " +
										   "	SUM(COALESCE(jan[2],0)) AS TOTAL_JAN_AMOUNT, " +
										   "	SUM(COALESCE(feb[1],0)) AS TOTAL_FEB_QTY, " + 
										   "	SUM(COALESCE(feb[2],0)) AS TOTAL_FEB_AMOUNT, " +
										   "	SUM(COALESCE(mar[1],0)) AS TOTAL_MAR_QTY, " +
										   "	SUM(COALESCE(mar[2],0)) AS TOTAL_MAR_AMOUNT, " +
										   "	SUM(COALESCE(apr[1],0)) AS TOTAL_APR_QTY, " +
										   "	SUM(COALESCE(apr[2],0)) AS TOTAL_APR_AMOUNT, " +
										   "	SUM(COALESCE(may[1],0)) AS TOTAL_MAY_QTY, " +
										   "	SUM(COALESCE(may[2],0)) AS TOTAL_MAY_AMOUNT, " +
										   "	SUM(COALESCE(jun[1],0)) AS TOTAL_JUN_QTY, "+
										   "	SUM(COALESCE(jun[2],0)) AS TOTAL_JUN_AMOUNT, " +
										   "	SUM(COALESCE(jul[1],0)) AS TOTAL_JUL_QTY, " +
										   "	SUM(COALESCE(jul[2],0)) AS TOTAL_JUL_AMOUNT, " +
										   "	SUM(COALESCE(aug[1],0)) AS TOTAL_AUG_QTY, " +
										   "	SUM(COALESCE(aug[2],0)) AS TOTAL_AUG_AMOUNT, " +
										   "	SUM(COALESCE(sep[1],0)) AS TOTAL_SEP_QTY, " +
										   "	SUM(COALESCE(sep[2],0)) AS TOTAL_SEP_AMOUNT, " +
										   "	SUM(COALESCE(oct[1],0)) AS TOTAL_OCT_QTY, " +
										   "	SUM(COALESCE(oct[2],0)) AS TOTAL_OCT_AMOUNT, " +
										   "	SUM(COALESCE(nov[1],0)) AS TOTAL_NOV_QTY, " +
										   "	SUM(COALESCE(nov[2],0)) AS TOTAL_NOV_AMOUNT, " +
										   "	SUM(COALESCE(DEC[1],0)) AS TOTAL_DEC_QTY, " +
										   "	SUM(COALESCE(DEC[2],0)) AS TOTAL_DEC_AMOUNT " +
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
										   "dec INTEGER[]) "); 	
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			Map<String, Object> sales= (Map<String, Object>)query.uniqueResult();
			return sales;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return null;
	}
	}
