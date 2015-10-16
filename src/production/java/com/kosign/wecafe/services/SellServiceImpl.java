package com.kosign.wecafe.services;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.kosign.wecafe.entities.Order;
import com.kosign.wecafe.entities.Product;
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
	public List<Product> getDetailSellProduct(long id) {
		Session session = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			session.getTransaction().begin();
			
			Query query = session.createQuery("SELECT Product"
											+ "FROM OrderDetail "
											+ "INNER JOIN OrderDetail.pk.product As Product "
											+ "INNER JOIN OrderDetail.pk.product.category AS Category"
											+ "Where OrderDetail.pk.order.orderId = ?");
			query.setParameter(0, id);
			
			List<Product> products = (List<Product>)query.list();
				
			return products;
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return null;
	}
	
	public List<Order> getAllOrders() {
		Session session = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			session.getTransaction().begin();
			
			Query query = session.createQuery("FROM Order"
											+ "WHERE Order.status = 1");
			
			List<Order> orders = (List<Order>)query.list();
			
			return orders;
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return null;
	}

}
