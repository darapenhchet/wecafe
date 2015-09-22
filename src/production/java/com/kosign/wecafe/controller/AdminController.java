package com.kosign.wecafe.controller;

import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosign.wecafe.entities.Category;
import com.kosign.wecafe.entities.Product;

@Controller
@RequestMapping(value="/admin")
public class AdminController {

	@RequestMapping(value={"/dashboard","/","/home"})
	public String dashboard(){
		return "admin/dashboard";
	}
	
	@RequestMapping(value="/productlist")
	public String productlist(Map<String, Object> model){
		/* Configuration */
		Configuration configuration = new Configuration();
		
		configuration.addAnnotatedClass(Product.class);
		configuration.addAnnotatedClass(Category.class);
		
		configuration.setProperties(new Properties(){
			{
				put("hibernate.connection.username","postgres");
				put("hibernate.connection.password","postgres");
				put("hibernate.connection.driver_class","org.postgresql.Driver");
				put("hibernate.connection.url","jdbc:postgresql://192.168.178.72:5432/WeCafe");
				put("hibernate.hbm2ddl.auto","update");
			}
			
		});
		
		/* Building SessionFactory */
		SessionFactory sessionFactory = configuration
				.buildSessionFactory(new StandardServiceRegistryBuilder(
						).applySettings(configuration.getProperties()).build());
		
		/* Obtain Session and call Persistence Methods */
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		/*
		Product product = new Product();
		product.setProductName("Pepsi NEW");
		product.setQuantity(10L);
		product.setUnitPrice(new BigDecimal(1500));
		product.setCostPrice(new BigDecimal(1300));
		product.setSalePrice(new BigDecimal(1500));
		product.setCategoryId(1L);
		product.setImage("");		
		
		session.save(product);
		*/
		Query query = session.createQuery("FROM Product");
					
		List<Product> products = query.list();
		
		session.getTransaction().commit();
		session.close();
		
		for(Product product : products){
			System.out.println(product.getProductName());
		}
		model.put("products", products);
		return "admin/productlist";
	}
	
	@RequestMapping(value="/productadd")
	public String productadd(){
		return "admin/productadd";
	}
	
	@RequestMapping(value="/categorylist")
	public String categorylist(){
		return "admin/categorylist";
	}
	
	@RequestMapping(value="/categoryadd")
	public String categoryadd(){
		return "admin/categoryadd";
	}
	
	@RequestMapping(value="/orderlist")
	public String orderlist(){
		return "admin/orderlist";
	}
	
	@RequestMapping(value="/orderadd")
	public String orderadd(){
		return "admin/orderadd";
	}
	
	@RequestMapping(value="/salelist")
	public String salelist(){
		return "admin/salelist";
	}
	
	@RequestMapping(value="/saleadd")
	public String saleadd(){
		return "admin/saleadd";
	}
	
	@RequestMapping(value="/supplierlist")
	public String supplierlist(){
		return "admin/supplierlist";
	}
	
	@RequestMapping(value="/supplieradd")
	public String supplieradd(){
		return "admin/supplieradd";
	}
	
	@RequestMapping(value="/userlist")
	public String userlist(){
		return "admin/userlist";
	}
	
	@RequestMapping(value="/useradd")
	public String useradd(){
		return "admin/useradd";
	}
	
}
