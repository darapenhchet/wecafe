package com.kosign.wecafe.services;

import java.math.BigDecimal;
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
import com.kosign.wecafe.entities.Sale;
import com.kosign.wecafe.forms.Cart;
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
	public Boolean addNewSaleProducts(List<Cart> carts) {
		Session session = null;
		try {
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			
			Sale sale = new Sale();
			sale.setSaleDatetime(new Date());
			sale.setMoneyIn(new BigDecimal("2000"));
			sale.setUserId(1L);
			
			System.out.println("SALE DATE="+ sale.getSaleDatetime());
			
/*			Order order = new Order();
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
				orderDetaill.setProUnitPrice(product.getSalePrice());

				order.getOrderDetail().add(orderDetaill);
			}
			*/
			
			Order order = new Order();
			order.setOrderDate(new Date());
			order.setCusId(1L);
			order.setStatus(1);
			
			for(Cart cart : carts){
				Product product = session.get(Product.class, new Long(cart.getProductId()));	
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setOrder(order);
				orderDetail.setProduct(product);
				orderDetail.setProComment("");
				orderDetail.setProQty(cart.getQuantity());
				orderDetail.setProUnitPrice(product.getSalePrice());
				sale.setTotalAmount(sale.getTotalAmount().add((product.getSalePrice().multiply(new BigDecimal(cart.getQuantity())))));
				
				product.setQuantity(product.getQuantity()-cart.getQuantity());
				
				session.update(product);
				
				order.getOrderDetail().add(orderDetail);
			} 

			sale.setOrder(order);

		
			session.save(sale);
			
			session.getTransaction().commit();
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			session.getTransaction().rollback();
		}finally{
			session.close();
		}
		return false;
	}
	
}
