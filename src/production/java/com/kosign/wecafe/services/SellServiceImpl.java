package com.kosign.wecafe.services;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.kosign.wecafe.entities.Order;
import com.kosign.wecafe.entities.Sale;
import com.kosign.wecafe.util.HibernateUtil;

@Service
public class SellServiceImpl implements SellService {

	@Override
	public List<Sale> getSellAllList() {
		
		Session session = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			session.getTransaction().begin();
			Query query = session.createQuery("From Sale");
			List<Sale> sales= (List<Sale>)query.list();
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
				System.out.println(order.getOrderAmount());
			}
			return orders;
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return null;
	}

}
