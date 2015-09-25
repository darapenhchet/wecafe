package com.kosign.wecafe.controller.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.services.CategoryService;
import com.kosign.wecafe.services.ProductService;

@Controller
public class ProductController {
	
	@Inject
	private ProductService productService;
	
	@Inject
	private CategoryService categoryService;
	
	
	@RequestMapping(value="/admin/products", method=RequestMethod.GET)
	public String listAllProducts(Map<String, Object> model){
		model.put("products", productService.getAllProducts());
		return "admin/productlist";
	}
	
	@RequestMapping(value="/admin/productadd", method=RequestMethod.GET)
	public String productadd(Map<String, Object> model){
		model.put("categories", categoryService.getAllCategories());
		return "admin/productadd";
	}	
	
	@RequestMapping(value="/admin/product/add", method=RequestMethod.POST, consumes= MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)
	public  @ResponseBody boolean addNewProduct(@RequestBody Product product){
		/*List<Product> products = new ArrayList<>();
		if(session.getAttribute("products")!=null){
			products = (ArrayList<Product>)session.getAttribute("products");
		}
		products.add(product);*/		
		
		//System.out.println(product.getProductName());
		return productService.addNewProduct(product);
		//return ((Product)session.getAttribute("product")).getProductName();
		
	}
	
	@RequestMapping(value="/admin/product/{id}", method=RequestMethod.GET)
	public String updateProduct(@PathVariable("id") Integer id){
		return "";
	}
		
	@RequestMapping(value="/admin/product/update", method=RequestMethod.POST)
	public boolean updateProduct(Product product){
		return false;
	}
	
	@RequestMapping(value="/admin/product/delete/{id}", method=RequestMethod.POST)
	public boolean deleteProduct(@PathVariable("id") Long id){
		return false;
	}

}
