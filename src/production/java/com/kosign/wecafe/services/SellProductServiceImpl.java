package com.kosign.wecafe.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.kosign.wecafe.entities.Order;
import com.kosign.wecafe.entities.OrderDetail;
import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.util.HibernateUtil;

@Service
@SuppressWarnings("unchecked")
public class SellProductServiceImpl implements SellProductsService {

	@Override
	public List<Product> getAllProducts() {
		
		Session session = null;
		try{
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			
			Query query = session.createQuery("FROM Product");
			
			List<Product> products = query.list();
			
			session.getTransaction().commit();
			return products;
		}catch(Exception ex){
			ex.printStackTrace();
			session.getTransaction().rollback();
		}finally{
			session.close();
			//HibernateUtil.getSessionFactory().close();
		}
		return null;
	}

	@Override
	public Boolean addNewOrderProducts(Product product, Order order, OrderDetail orderDetil,  HttpSession sessions) {
		Session session = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			order.setOrderDate(new Date());
			order.setCusId(1L);
			
			List<Product> products = new ArrayList<>();
			
			if(sessions.getAttribute("products") != null){
				products = (ArrayList<Product>)sessions.getAttribute("products");
				
			}
			products.add(product);
			
			for (int i = 0; i < products.size(); i++) {

				OrderDetail orderDetaill = new OrderDetail();
				orderDetaill.setProduct(product);
				orderDetaill.setOrder(order);
				orderDetaill.setProComment("comment");
				orderDetaill.setProQty(new Long(1));
				orderDetaill.setProStatus(0);
				orderDetaill.setProStatus(0);
				orderDetaill.setProUnitPrice(product.getSalePrice());

				order.getOrderDetail().add(orderDetaill);
			}
			
			session.save(order);
			
			session.getTransaction().commit();
			session.close();
			
		} finally {
			
		}

		return null;
	}

	
}
