package com.kosign.wecafe.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
import com.kosign.wecafe.forms.ImportForm;
import com.kosign.wecafe.util.HibernateUtil;

@Service
public class ImportServiceImp implements ImportService {

	@Inject UserService userService;
	
	@Override
	public List<Map> listAllImportProduct() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			/*Query query = session.createQuery("SELECT new Map(io.proQty as proQty ,product.productName as productName, ip.userId as userId"
					+ "							 )"
					+ "FROM ImportDetail io "
					+ "INNER JOIN io.pk1.product product "
					+ "INNER JOIN io.pk1.importProduct ip ");
			Query query = session.createQuery("SELECT new Map("
					+ "io.proQty as proQty"
					+ ",ip.impId as impId"
					+ ", io.unitPrice as unitPrice"
					+ ", io.proStatus as status"
					+ ",product.productName as productName"
					+ ",ip.userId as userId"
					+ ",sp.supplierName as supplierName)"
					+ "FROM ImportDetail io "
					+ "INNER JOIN io.pk1.product product "
					+ "INNER JOIN io.pk1.importProduct ip "
					+ "INNER JOIN io.supplier sp"
					);*/
			
/*			Query query = session.createQuery("SELECT new Map("
					+ "io.proQty as proQty"
					+ ",ip.impId as impId"
					+ ", io.unitPrice as unitPrice"
					+ ", io.proStatus as status"
					+ ",product.productName as productName"
					+ ", product.productId as productId"
					+ ",ip.userId as userId"
					+ ",ip.impDate as impDate"
					+ ",ip.totalAmount as totalAmount)"
					+ "FROM ImportDetail io "
					+ "INNER JOIN io.pk1.product product "
					+ "INNER JOIN io.pk1.importProduct ip "
					
//					+ "INNER JOIN io.supplier sp "
//					+ "WHERE ip.impId = ? "
					);*/
			Query query = session.createQuery("FROM ImportProduct");
			
			List<Map> importProducts = (ArrayList<Map>)query.list();
//			System.out.println("products.size()" + products.size());
//			for(Map Product : importProducts){
//				
//			}
			return importProducts;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		
		return null;
	}
//	@Override
//	public List<ImportProduct> listAllImportProduct() {
//		Session session = null;
//		try{
//			session = HibernateUtil.getSessionFactory().openSession();
//			session.getTransaction().begin();
//			Query query = session.createQuery("SELECT ImportProduct");
//			List<ImportProduct>	importProducts = (List<ImportProduct>)query.list();	
//			session.getTransaction().commit();
//			return importProducts;
//		}catch(Exception e){
//			e.printStackTrace();
//		}finally {
//			session.close();
//		}
//		
//		return null;
//	}
	@Override
	public Boolean saveImportPro(List<ImportForm> importform) {
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			//1. save import product 
			ImportProduct importProduct = new ImportProduct();
			importProduct.setImpDate(new Date());
			User user = userService.findUserByUsername(getPrincipal());
			importProduct.setUserId(user.getId());
			System.out.println("userid idididi" + user.getId());
			//session.save(importProduct);

			//2.save import detail
			
			for(int i=0; i < importform.size();i++){
				
				ImportDetail importdetail = new ImportDetail();
				Product product = new Product();
				product.setProductId(importform.get(i).getProId());
				System.out.println("importform.size(pid)" + importform.get(i).getProId());
				importdetail.setProduct(product);
				importdetail.setImportProduct(importProduct);
				importdetail.setProQty(importform.get(i).getQuantity());
				System.out.println("importform.size(pid)" + importform.get(i).getQuantity());
				importdetail.setProStatus(true);
				Supplier suppliers = new Supplier();
				suppliers.setSupId(importform.get(i).getSupplierId());
				importdetail.setSupplier(suppliers);
				System.out.println("importform.get(i).getSupplierId()" + importform.get(i).getSupplierId());
				importdetail.setSupplierid(importform.get(i).getSupplierId());
				importdetail.setUnitPrice(importform.get(i).getUnitPrice());
				System.out.println("importform.size(price)" + importform.get(i).getUnitPrice());
				importProduct.getImportDetail().add(importdetail);
				//session.save(importdetail);
				
				
				//3. update product (stock)
				Product products  = session.get(Product.class, importdetail.getProduct().getProductId());
				System.out.println("importdetail.getProduct().getProductId()" + products.getQuantity());
				products.setQuantity(products.getQuantity() + importform.get(i).getQuantity() );
				System.out.println("product.getQuantity()" +  importform.get(i).getQuantity());
				session.update(products);
			}
			
			//importProduct.setImpId(impId);
			
			session.save(importProduct);
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

	@Override
	public Boolean updateImportPro(ImportForm importform) {
		Session session = HibernateUtil.getSessionFactory().openSession();
	    try {
			session.getTransaction().begin();
			ImportProduct importproduct = new ImportProduct();
			ImportDetail importdetail = new ImportDetail();
			importdetail.setProQty(importform.getQuantity());
			importdetail.setUnitPrice(importform.getUnitPrice());
			importdetail.setSupplierid(importform.getSupplierId());
			importproduct.getImportDetail().add(importdetail);
			
			
			session.update(importproduct);
			session.getTransaction().commit();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.getStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public Map findById(Long id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			
			Query query = session.createQuery("SELECT new Map("
					+ "io.proQty as proQty"
					+ ",ip.impId as impId"
					+ ", io.unitPrice as unitPrice"
					+ ", io.proStatus as status"
					+ ",product.productName as productName"
					+ ", product.productId as productId"
					+ ",ip.userId as userId"
					+ ",sp.supplierName as supplierName)"
					+ "FROM ImportDetail io "
					+ "INNER JOIN io.pk1.product product "
					+ "INNER JOIN io.pk1.importProduct ip "
					+ "INNER JOIN io.supplier sp "
					+ "WHERE ip.impId = ? "
					);
			query.setParameter(0, id);
			
			Map importProducts = (Map)query.uniqueResult();
			
			return importProducts;
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return null;
	}
	
	public List<ImportDetail> listAllImportDetail(Long id){
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().begin();
			Query query = session.createQuery("FROM ImportDetail WHERE impId = ? ");
			query.setParameter(0, id);
			List<ImportDetail> importDetails = query.list();
			session.getTransaction().commit();
			return importDetails;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.getStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return null;
	}
}
