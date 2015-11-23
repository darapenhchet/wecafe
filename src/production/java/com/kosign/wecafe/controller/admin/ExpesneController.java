package com.kosign.wecafe.controller.admin;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosign.wecafe.services.ExpenseService; 

@Controller
public class ExpesneController {
	
	@Inject ExpenseService expenseService;
		
	@RequestMapping(value="/admin/expenselist", method=RequestMethod.GET)
	public String listAllExpense(Map<String, Object>model){ 
		
		model.put("expenses", expenseService.listAllExpense());
		return "admin/expenselist";
	}
	 
}
