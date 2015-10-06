package com.kosign.wecafe.controller.admin;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosign.wecafe.services.CategoryService;

@Controller
public class CategoryController {
	
	@Inject
	CategoryService categoryService;
	
	@RequestMapping(value="/admin/categorylist")
	public String getAllCategories(Map<String, Object> model){
		model.put("categories", categoryService.getAllCategories());
		return "admin/categorylist";
	}
}
