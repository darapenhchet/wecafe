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

import com.kosign.wecafe.forms.Cart;
import com.kosign.wecafe.services.SellProductsService;

@Controller
public class SellController {
	
	@Inject SellProductsService sellProductService;
	
	@RequestMapping(value="/seller")
	public String listAllProducts(Map<String, Object> model){
		model.put("products", sellProductService.getAllProducts());
		return "seller/seller";
	}
	
	@RequestMapping(value="/seller/addtocart", method=RequestMethod.POST, consumes= MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Cart> addNewProduct(HttpSession session, @RequestBody Cart cart){
		List<Cart> carts = new ArrayList<Cart>();
		if(session.getAttribute("carts")!=null){
			carts = (ArrayList<Cart>)session.getAttribute("carts");
		}
		carts.add(cart);
		session.setAttribute("Carts", carts);
		return carts;
	}
	
	@RequestMapping(value="/seller/listtocart", method=RequestMethod.POST, consumes= MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE )
	public @ResponseBody List<Cart> listtocart (HttpSession session){
		List<Cart> carts = new ArrayList<Cart>();
		if(session.getAttribute("carts")!=null){
			carts = (ArrayList<Cart>) session.getAttribute("carts");
		}
		return carts;
		
	}
	
}
