package com.kosign.wecafe.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosign.wecafe.services.OrderProductService;

@Controller
@RequestMapping(value="/order")
public class OrderController {

	@Inject 
	OrderProductService orderProductService ;
	
	@RequestMapping(value={"/"})
	public String index(){
		orderProductService.addNewOrder();
		return "order/order";
	}
 
}
