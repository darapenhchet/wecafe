package com.kosign.wecafe.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.services.OrderProductService;

@Controller
@RequestMapping(value="/order")
public class OrderController {

	@Inject 
	OrderProductService orderProductService ;
	
	@RequestMapping(value={"/"})
	public String index(Map<String ,Object> model){
		List<Product> products = orderProductService.getProduct();
		model.put("products", products);
		
		for(Product product : products){
			System.out.println(product.getProductName());
		}
		return "order/order";
	}
 
}
