package com.kosign.wecafe.services;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.kosign.wecafe.entities.Order;
import com.kosign.wecafe.entities.OrderDetail;
import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.forms.Cart;
import com.kosign.wecafe.util.HibernateUtil;

@Service
public class OrderProductServiceImpl implements OrderProductService{

	@Override
	public boolean addNewOrder(List<Cart> carts) {
		Session session = null;
		try{
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			
			Order order = new Order();
			order.setOrderDate(new Date());
			order.setCusId(1L);
			order.setStatus(1);
			
			for(Cart cart : carts){
				Product product = session.get(Product.class, new Long(cart.getProductId()));
				
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setOrder(order);
				orderDetail.setProduct(product);
				orderDetail.setProComment(cart.getComment());
				orderDetail.setProQty(cart.getQuantity());
				orderDetail.setProUnitPrice(product.getSalePrice());
				order.getOrderDetail().add(orderDetail);
			} 
			session.save(order);			
			session.getTransaction().commit();
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			session.getTransaction().rollback();
		}finally{
			session.close();
			 //HibernateUtil.getSessionFactory().close();*/
		}
		return false;	
	}
	
	@Override
	public List<Product> getProduct(){
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
			 //HibernateUtil.getSessionFactory().close();*/
		}
		return null;		
			 
	}
}
