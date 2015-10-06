package com.kosign.wecafe.services;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.kosign.wecafe.entities.Category;
import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.util.HibernateUtil;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Override
	public List<Product> getAllProducts() {
		Session session = null;
		try{
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			
			Query query = session.createQuery("FROM Product ORDER BY createdDate DESC");
			
			List<Product> products = (List<Product>)query.list();
			
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
	public boolean addNewProduct(Product product) {
		Session session = null;
		try{
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			Category category = session.get(Category.class, product.getCategory().getCatId());
			product.setCategory(category);
			session.save(product);
			
			session.getTransaction().commit();
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			session.getTransaction().rollback();
		}finally{
			session.close();
			//HibernateUtil.getSessionFactory().close();
		}
		return false;
	}
	
	@Override
	public boolean deleteProduct(Long id) {
		Session session = null;
		try{
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			Product product = session.get(Product.class, id);
			product.setStatus(false);
			session.update(product);
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
	
	@Override
	public boolean updateProduct(Product product) {
		Session session = null;
		try{
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			Category category = session.get(Category.class, product.getCategory().getCatId());
			product.setCategory(category);
			product.setLastUpdatedDate(new Date());
			product.setStatus(true);
			session.update(product);		
			session.getTransaction().commit();
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			session.getTransaction().rollback();
		}finally{
			session.close();
			//HibernateUtil.getSessionFactory().close();
		}
		return false;
	}
	
	@Override
	public Product findProductById(Long id) {
		Session session = null;
		try{
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			
			Product product = session.get(Product.class, id);
			
			session.getTransaction().commit();
			return product;
		}catch(Exception ex){
			ex.printStackTrace();
			session.getTransaction().rollback();
		}finally{
			session.close();
		}
		return null;
	}
}
