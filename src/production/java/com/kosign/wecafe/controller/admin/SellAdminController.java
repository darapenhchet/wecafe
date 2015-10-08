package com.kosign.wecafe.controller.admin;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.services.SellService;

@Controller
public class SellAdminController {

	@Inject SellService sellService;
	
	@RequestMapping(name="/admin/salelist", method= RequestMethod.GET)
	public String getAllSell(Map<String, Object> model){
		System.out.println("fasdhfjsakfadfksdajfhgiriariaefio");
		model.put("Sale", sellService.getSellAllList());
		return "/admin/salelist";
	}
	
	@RequestMapping(name="/admin/sale/order/list/{id}", method= RequestMethod.GET)
	public @ResponseBody List<Product> getAllOrderDetailsByOrderId(@RequestBody @PathVariable("id") Long id){
		return sellService.getDetailSellProduct(id);
	}
}
