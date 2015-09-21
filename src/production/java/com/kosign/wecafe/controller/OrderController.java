package com.kosign.wecafe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/order")
public class OrderController {

	@RequestMapping(value={"/order","/"})
	public String dashboard(){
		return "order/order";
	}
 
}
