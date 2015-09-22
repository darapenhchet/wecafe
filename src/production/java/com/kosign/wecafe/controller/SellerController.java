package com.kosign.wecafe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/seller")
public class SellerController {

	@RequestMapping(value={"/seller","/"})
	public String dashboard(){
		return "seller/seller";
	}
 
}