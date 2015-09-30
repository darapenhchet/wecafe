package com.kosign.wecafe.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CategoryController {
	
	@RequestMapping(value="/admin/categories")
	public String getAllCategories(){
		return "admin/categorylist";
	}
}
