package com.kosign.wecafe.services;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosign.wecafe.entities.ImportProduct;
import com.kosign.wecafe.entities.Product;
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
	public List<ImportProduct> getListReportDetailPurchase() {
		Session session = null;
		try{
			session = sessionFactory.getCurrentSession();
			session.getTransaction().begin();
			Query query = session.createQuery("FROM ImportProduct");
			List<ImportProduct>	importProducts = (List<ImportProduct>)query.list();	
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
}
