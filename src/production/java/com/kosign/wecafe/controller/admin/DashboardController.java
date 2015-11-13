package com.kosign.wecafe.controller.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosign.wecafe.services.OrderProductService;
import com.kosign.wecafe.services.SellService;
import com.kosign.wecafe.services.UserService;
import com.kosign.wecafe.services.SellProductsService;

@Controller
public class DashboardController {

	@Autowired
	UserService userService;
	
	@Autowired
	SellService sellService;
	
	@Autowired
	OrderProductService orderProductService;
	
	@Autowired
	SellProductsService sellProductService;
	
	@RequestMapping(value={"/admin/dashboard","/admin/","/admin/home"})
	public String dashboard(Map<String, Object> model){
		model.put("TOTAL_SALES", userService.getAllUsers().size());
		model.put("NEW_ORDERS", sellProductService.getOrdered().size());
		model.put("TOTAL_USERS", userService.getAllUsers().size());
		return "admin/dashboard";
	}
}
