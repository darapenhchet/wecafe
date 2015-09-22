package com.kosign.wecafe.controller.admin;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosign.wecafe.services.SellProductsService;

@Controller
public class SellController {
	
	@Inject SellProductsService sellProductService;
	
	@RequestMapping(value="/seller")
	public String listAllProducts(Map<String, Object> model){
		model.put("products", sellProductService.getAllProducts());
		return "seller/seller";
	}
}
