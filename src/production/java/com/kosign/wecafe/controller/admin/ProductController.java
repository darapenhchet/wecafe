package com.kosign.wecafe.controller.admin;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosign.wecafe.services.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value="/admin/products")
	public String listAllProducts(Map<String, Object> model){
		model.put("products", productService.getAllProducts());
		return "admin/productlist";
	}
}
