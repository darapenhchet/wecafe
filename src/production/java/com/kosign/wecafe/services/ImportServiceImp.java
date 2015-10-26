package com.kosign.wecafe.services;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.kosign.wecafe.entities.ImportDetail;
import com.kosign.wecafe.entities.ImportProduct;
import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.entities.Supplier;
import com.kosign.wecafe.entities.User;
import com.kosign.wecafe.util.HibernateUtil;

@Service
public class ImportServiceImp implements ImportService {

	@Inject UserService userService;
	
	@Override
	public Boolean saveImportPro(ImportDetail importDetail) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			
			ImportProduct importProduct = new ImportProduct();
			importProduct.setImpDate(new Date());
			User user = userService.findUserByUsername(getPrincipal());
			importProduct.setUserId(user.getId());
			session.save(importProduct);
			importDetail.setImportProduct(importProduct);
//			importDetail.setImpId(importProduct.getImpId());
			session.save(importDetail);
			
//			Product product = session.get(Product.class, importDetail.getOrder().getOrderId());
			Product product  = session.get(Product.class, importDetail.getImportProduct().getImpId());
			product.setQuantity(product.getQuantity() + importDetail.getProQty() );
			session.update(product);
			//importProduct.setImpId(impId);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			session.beginTransaction().rollback();
		}finally {
			session.close();
		}
		
		return null;
	}

	@Override
	public List<Product> listAllProduct() {
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery("FROM Product");
			List<Product> products = query.list();
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

	@Override
	public List<Supplier> listAllSupplier() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery("FROM Supplier");
			 List<Supplier> suppliers= query.list();
			 return suppliers; 
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return null;
	}
	
	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
	
	
}
