package com.kosign.wecafe.controller.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosign.wecafe.entities.Product;
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
	
	@RequestMapping(value="/admin/product/add", method=RequestMethod.POST, consumes= MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)
	public  @ResponseBody boolean addNewProduct(@RequestBody Product product){
		System.out.println(product.getProductName());
		return productService.addNewProduct(product);		
	}

}
