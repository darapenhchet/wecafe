package com.kosign.wecafe.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.math.BigDecimal;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;



import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	public String listAllProducts(HttpSession session, Map<String, Object> model){
		List<Cart> carts = new ArrayList<Cart>();
		if(session.getAttribute("CARTS")!=null){
			carts = (List<Cart>)session.getAttribute("CARTS");
		}
		model.put("carts", carts);
		model.put("products", sellProductService.getAllProducts());
		return "seller/seller";
	}
	
	@RequestMapping(value="/seller/addtocart", method=RequestMethod.POST, consumes= MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)
	public  @ResponseBody List<Cart> addProductToCart(HttpSession session, @RequestBody Cart cart){
		List<Cart> carts = new ArrayList<Cart>();
		if(session.getAttribute("CARTS")!=null){
			carts = (ArrayList<Cart>)session.getAttribute("CARTS");
			
			for(int i=0; i <carts.size();i++){
				
				System.out.println("cart.getProductName" + cart.getProductName());
				System.out.println("carts.get(i).getProductName()" + carts.get(i).getProductName());
				if(carts.get(i).getProductId().equals(cart.getProductId())){
					carts.get(i).setQuantity(carts.get(i).getQuantity()+ cart.getQuantity());
					carts.get(i).setTotalAmount(cart.getPrice().multiply(new BigDecimal(carts.get(i).getQuantity())));
					session.setAttribute("Carts", carts);
					return carts;
				}
			}
		}
		carts.add(cart); 
		
		session.setAttribute("CARTS", carts);
		
		return carts;
	}
	
	@RequestMapping(value="/seller/removeallfromcart", method=RequestMethod.POST, consumes= MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Boolean removeProductInCart(HttpSession session){
		if(session.getAttribute("CARTS") != null){
			session.setAttribute("CARTS", null);
			return true;
		}
		return false;
		
		
	}
	@RequestMapping(value="/seller/listtocart", method=RequestMethod.POST, consumes= MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)
	public  @ResponseBody List<Cart> listAllProductsInCart(HttpSession session/*, @RequestBody Cart cart*/){
		List<Cart> carts = new ArrayList<Cart>();
		if(session.getAttribute("CARTS")!=null){
			carts = (ArrayList<Cart>)session.getAttribute("CARTS");
		}
		return carts;
	}

	@RequestMapping(value="/seller/removetocart/{id}", method=RequestMethod.POST, consumes= MediaType.APPLICATION_JSON_VALUE, produces= MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Cart> removeproductfromcart(HttpSession session, @PathVariable("id") Long productId){
		System.out.println("Product ID = " + productId);
		List<Cart> carts = new ArrayList<Cart>();
		if(session.getAttribute("CARTS") != null){
			carts = (ArrayList<Cart>)session.getAttribute("CARTS");
		}
			
		for(Cart cart: carts){
			if(cart.getProductId().equals(productId)){
				long bb = cart.getQuantity();
				long aa = 1L;
				if( bb > aa){
					cart.setQuantity(cart.getQuantity() - 1);
					System.out.println("cart.getQuantity()" + cart.getQuantity());
				}
				else{
					System.out.println("cart.getQuantity()" + cart.getQuantity());
					carts.remove(cart);
					System.out.println("TRUE");
					break;
				}
				
			}
			System.err.println("FALSE");
		}
		session.setAttribute("CARTS", carts);
		return carts;
	}
	
	@RequestMapping(value="/seller/insertcartsell", method=RequestMethod.POST, consumes= MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)
	public  @ResponseBody Boolean insertProductFromCart(HttpSession session){
		
		List<Cart> carts = new ArrayList<Cart>();
		if(session.getAttribute("CARTS")!=null){
			carts = (ArrayList<Cart>)session.getAttribute("CARTS");
			System.out.println("CARTS SIZE:"+ carts.size());
			return sellProductService.addNewSaleProducts(carts);
		}
		return false;
	}

}
