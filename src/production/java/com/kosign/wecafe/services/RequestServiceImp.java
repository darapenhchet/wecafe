package com.kosign.wecafe.services;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosign.wecafe.entities.ImportProduct;
import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.entities.RequestStock;
import com.kosign.wecafe.entities.RequestStockDetail;
import com.kosign.wecafe.entities.Supplier;
import com.kosign.wecafe.entities.User;
import com.kosign.wecafe.forms.RequestForm;

@Service
public class RequestServiceImp implements RequestService {

	@Inject UserService userService;
	
	@Autowired SessionFactory sessionFactory;

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
	public List<ImportProduct> listAllImportProduct() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	@Transactional
	public Boolean saveRequestPro(List<RequestForm> requestForm) {

		Session session = sessionFactory.getCurrentSession();
		try {
			session.getTransaction().begin();
			//1. save import product 
			RequestStock requestStock = new RequestStock();
			requestStock.setStatus(true);
			User user = userService.findUserByUsername(getPrincipal());
			requestStock.setUserRequest(user);
		
			//2.save import detail
			
			for(int i=0; i < requestForm.size();i++){
				RequestStockDetail requestDetail = new RequestStockDetail();
				Product product = new Product();		
				product.setProductId(requestForm.get(i).getProId());					
				requestDetail.setProduct(product);			
				requestDetail.setRequestStock(requestStock);				
				requestDetail.setProQty(requestForm.get(i).getProQty());									
				requestStock.getRequestStockDetail().add(requestDetail);
				
				//session.save(requestDetail);				
				/*//3. update product (stock)
				Product products  = session.get(Product.class, requestDetail.getProduct().getProductId());
				System.out.println("requestDetail.getProduct().getProductId()" + products.getQuantity());
				products.setQuantity(products.getQuantity() + requestForm.get(i).getQuantity() );
				System.out.println("product.getQuantity()" +  requestForm.get(i).getQuantity());
				session.update(products);*/
			}
			session.save(requestStock);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
		}
		return null;
	}

	@Override
	public List<Product> listAllProduct() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Supplier> listAllSupplier() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean updateRequestPro(List<RequestForm> requestForm, Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map> listAllRequestDetail(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean deleteRequestPro(List<RequestForm> requestForm, Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	 
}
