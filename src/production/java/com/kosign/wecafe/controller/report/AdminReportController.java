package com.kosign.wecafe.controller.report;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosign.wecafe.entities.ImportProduct;
import com.kosign.wecafe.forms.DateForm;
import com.kosign.wecafe.services.AdminReportService;

@Controller
public class AdminReportController {

	@Inject AdminReportService adminReportService;
	
	@RequestMapping(value="/admin/sellreport", method=RequestMethod.GET)
	public String ListReportSell(Map<String, Object>model){
		model.put("reportSell", adminReportService.getReportListAllSellProduct());
//		for (Map product : adminReportService.getreportListAllProduct()) {
//			System.out.println("productName" + product.get("productName"));
//			
//		}
		return "admin/reportSell";
	}
	
	@RequestMapping(value="/admin/orderreport", method=RequestMethod.GET)
	public String ListReportOrder(Map<String, Object>model){
		model.put("reportOrder", adminReportService.getReportListAllOrderProduct());
		return "admin/reportOrder";
	}
	
	@RequestMapping(value="/admin/purchasereport", method=RequestMethod.GET)
	public String ListReportpurchase(){
	//	model.put("reportPurchase", adminReportService.getReportListAllPurchase());
		return "admin/purchase-report";
	}
	
	@RequestMapping(value="/admin/purchasereportdetail", method=RequestMethod.GET)
	public @ResponseBody List<ImportProduct> ListReportDetailPurchase(Map<String, Object>model){
		return adminReportService.getListReportDetailPurchase();
		
	}
	
	@RequestMapping(value="/admin/getsearchsellbydate", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Map> searchSalebyDate(@RequestBody DateForm dateForm){
		return adminReportService.getSearchSellbyDate(dateForm);
	}
	@RequestMapping(value="/admin/getsearchorderbydate", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Map> searchOrderbyDate(@RequestBody DateForm dateForm){
		return adminReportService.getSearchOrderbyDate(dateForm);
	}
	
	@RequestMapping(value="/admin/beveragestock", method=RequestMethod.GET)
	public String ListAllBeverageStock(Map<String, Object>model){
		
		return "admin/reportbeveragestock";
	}
	
	@RequestMapping(value="/admin/getsearchBeveragebydate", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Object[]> getsearchBeveragebydate(@RequestBody DateForm dateForm){
		
		return adminReportService.getReportListAllBeverageStock(dateForm);
	}
	
	@RequestMapping(value="/admin/cupstock")
	public String ListAllCupStock(){
		return "admin/reportcupstock";
	}
	
	@RequestMapping(value="/admin/getsearchCupbydate", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<Object[]> getsearchCupbyday(@RequestBody DateForm dateForm){
		
		return adminReportService.getReportListAllCupStockbyDate(dateForm);
	}
}
