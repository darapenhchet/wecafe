package com.kosign.wecafe.services;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.util.HibernateUtil;

@Service
public class OrderProductServiceImpl implements OrderProductService{

	@Override
	public boolean addNewOrder() {
		// TODO Auto-generated method stub
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
			HibernateUtil.getSessionFactory().close();
		}
		return null;		
			 
	}
}
