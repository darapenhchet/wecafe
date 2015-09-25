package com.kosign.wecafe.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosign.wecafe.entities.OrderDetail;
import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.forms.Cart;
import com.kosign.wecafe.services.OrderProductService;
import com.kosign.wecafe.services.ProductService;

@Controller
@RequestMapping(value="/order")
public class OrderController {

	@Inject 
	OrderProductService orderProductService ;
	
	@Inject
	ProductService productService;
	
	@RequestMapping(value={"/"})
	public String index(Map<String ,Object> model){
		List<Product> products = orderProductService.getProduct();
		model.put("products", products);
		
		for(Product product : products){
			System.out.println(product.getProductName());
		}
		return "order/order";
		
	}
	
	@RequestMapping(value="/addtocart", method=RequestMethod.GET, consumes= MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)
	public  @ResponseBody List<Cart> addNewProduct(HttpSession session, @RequestBody Cart cart){
		List<Cart> carts = new ArrayList<Cart>();
		if(session.getAttribute("CARTS")!=null){
			carts = (ArrayList<Cart>)session.getAttribute("CARTS");
		}
		carts.add(cart); 
		
		session.setAttribute("CARTS", carts);
		
		return carts;
	}
 
}
