package com.kosign.wecafe.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.math.BigDecimal;

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
	public  @ResponseBody List<Cart> addProductToCart(HttpSession session, @RequestBody Cart cart){
		List<Cart> carts = new ArrayList<Cart>();
		if(session.getAttribute("CARTS")!=null){
			carts = (ArrayList<Cart>)session.getAttribute("CARTS");
			
			for(int i=0; i <carts.size();i++){
				
				System.out.println("cart.getProductName" + cart.getProductName());
				System.out.println("carts.get(i).getProductName()" + carts.get(i).getProductName());
				if(carts.get(i).getProductId().equals(cart.getProductId())){
					carts.get(i).setQuantity(carts.get(i).getQuantity()+ cart.getQuantity());
					BigDecimal bd =  new BigDecimal(carts.get(i).getQuantity());
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
	
//	@RequestMapping(value="/seller/addtocart", method=RequestMethod.POST, consumes= MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)
//	public @ResponseBody List<Cart> addNewProduct(HttpSession session, @RequestBody Cart cart){
//		List<Cart> carts = new ArrayList<Cart>();
//		if(session.getAttribute("carts")!=null){
//			carts = (ArrayList<Cart>)session.getAttribute("carts");
//			/*for(int i=0; i<carts.size();i++){
//				if(carts.get(i).getProductId().equals(cart.getProductId())){
//					carts.get(i).setQuantity(carts.get(i).getQuantity()+cart.getQuantity());
//					session.setAttribute("Carts", carts);
//					return carts;
//				}
//			}*/
//		}
//		carts.add(cart);
//		session.setAttribute("Carts", carts);
//		System.out.println(session.getAttribute("carts"));
//		System.out.println(carts);
//		return carts;
//	}
	@RequestMapping(value="/seller/listtocart", method=RequestMethod.POST, consumes= MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)
	public  @ResponseBody List<Cart> listAllProductsInCart(HttpSession session/*, @RequestBody Cart cart*/){
		List<Cart> carts = new ArrayList<Cart>();
		if(session.getAttribute("CARTS")!=null){
			carts = (ArrayList<Cart>)session.getAttribute("CARTS");
		}
		return carts;
	}

	@RequestMapping(value="/insertcartsell", method=RequestMethod.POST, consumes= MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)
	public  @ResponseBody List<Cart> insertProductFromCart(HttpSession session){
		
		List<Cart> carts = new ArrayList<Cart>();
		if(session.getAttribute("CARTS")!=null){
			carts = (ArrayList<Cart>)session.getAttribute("CARTS");
//			sellProductService.addNewOrder(carts);
		}
		return carts;
	}
	
}
