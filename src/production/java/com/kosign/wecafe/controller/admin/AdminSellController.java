package com.kosign.wecafe.controller.admin;

import java.security.Principal;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosign.wecafe.services.SellService;

@Controller
@RequestMapping(name="/admin/sale")
public class AdminSellController {

	@Autowired SellService sellService;
	
	@RequestMapping(name="list", method= RequestMethod.GET)
	public String getAllSell(Map<String, Object> model, Principal principal){
		System.out.println("fasdhfjsakfadfksdajfhgiriariaefio");
		model.put("Sale", sellService.getSellAllList());
		return "admin/salelist";
	}
	
	@RequestMapping(name="/order/all")
	public String getAllOrders(){
		System.out.println("HELLO WORLD ");
		return "admin/productlist";
	}
}
