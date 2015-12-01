package com.kosign.wecafe.controller.admin;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosign.wecafe.entities.ExpenseDetail;
import com.kosign.wecafe.entities.ImportDetail;
import com.kosign.wecafe.forms.ExpenseForm;
import com.kosign.wecafe.forms.ImportForm;
import com.kosign.wecafe.services.ExpenseService; 

@Controller
public class ExpesneController {
	
	@Inject ExpenseService expenseService;
		
	@RequestMapping(value="/admin/expenselist", method=RequestMethod.GET)
	public String listAllExpense(Map<String, Object>model){ 
		
		model.put("expenses", expenseService.listAllExpense());
		return "admin/expenselist";
	}
	
	@RequestMapping(value="/admin/expenseadd", method=RequestMethod.GET)
	public String expProductAdd(){
		return "admin/expenseadd";
	}
	
	@RequestMapping(value="/admin/expenseupdate/{id}", method=RequestMethod.GET)
	public String viewById(@PathVariable("id") Long expid, Map<String, Object>model){
		 
		model.put("expensepro", expenseService.listExpenseDetail(expid));
		model.put("EXPENSE_ID", expid);		  
		 
		return "admin/expenseupdate";
	}
	
	@RequestMapping(value="/admin/saveupdate/{id}", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Boolean saveupdated(@RequestBody List<ExpenseForm> expenseform, @PathVariable("id") Long expId){
		 
		 try {
			return expenseService.updateExpense(expenseform, expId); 
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}  
		return false;
	}
	
	@RequestMapping(value="/admin/saveExpense", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Boolean saveexpense(@RequestBody List<ExpenseForm> expenseForm)	{
		ExpenseDetail expenseDetails = new ExpenseDetail();
		System.out.println("adfasfd" + expenseForm.size());
		try {
			
			
			return expenseService.saveExpense(expenseForm);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return false;
	} 
	
	@RequestMapping(value="/admin/getexpensedetail/{expid}", method=RequestMethod.GET) 
		public @ResponseBody List<ExpenseDetail> expensedetail(@PathVariable("expid") Long expid, Map<String, Object>model){ 
		 
		return expenseService.listExpenseDetail(expid);
	}
	 
}
