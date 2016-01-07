package com.kosign.wecafe.controller.admin.rest;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kosign.wecafe.entities.Pagination;
import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.entities.ProductFilter;
import com.kosign.wecafe.entities.User;
import com.kosign.wecafe.services.AdminReportService;
import com.kosign.wecafe.services.ProductService;
import com.kosign.wecafe.services.UserService;

//TODO: Product REST Controller
@RestController
@RequestMapping("api/admin/reports")
public class ReportPurchaseController {
	
	@Inject AdminReportService adminReportService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/purchasereportdetail", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getpurchasereportdetail(ProductFilter filter, Pagination pagination){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reportdetail", adminReportService.getListReportDetailPurchaseRest(filter.getByYear()));
		pagination.setTotalCount(adminReportService.count());
		pagination.setTotalPages(pagination.totalPages());
		map.put("pagination", pagination);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/purchasereportdaily", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getpurchasereportdaily(@RequestParam(value="startDate") String strStartDate, Pagination pagination) throws ParseException{
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = simpleDateFormat.parse(strStartDate);
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("Date = " + startDate);
		map.put("reportdaily", adminReportService.getListReportDailyPurchaseRest(startDate));
		pagination.setTotalCount(adminReportService.count());
		pagination.setTotalPages(pagination.totalPages());
		map.put("pagination", pagination);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		
	}
	@RequestMapping(value="/purchasereportweekly", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getpurchasereportweekly(@RequestParam(value="start_date") String strStartDate, @RequestParam(value="end_date") String strEndDate, 
			Pagination pagination) throws ParseException{
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = simpleDateFormat.parse(strStartDate);
		Date endDate = simpleDateFormat.parse(strEndDate);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reportweekly", adminReportService.getListReportWeeklyPurchaseRest(startDate, endDate));
		pagination.setTotalCount(adminReportService.count());
		pagination.setTotalPages(pagination.totalPages());
		map.put("pagination", pagination);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);		
	}
	@RequestMapping(value="/purchasereportmonthly", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getpurchasereportmonthly(@RequestParam(value="start_date") String strStartDate, @RequestParam(value="end_date") String strEndDate, 
			Pagination pagination) throws ParseException{
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = simpleDateFormat.parse(strStartDate);
		Date endDate = simpleDateFormat.parse(strEndDate);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reportmonthly", adminReportService.getListReportMonthlyPurchaseRest(startDate, endDate));
		pagination.setTotalCount(adminReportService.count());
		pagination.setTotalPages(pagination.totalPages());
		map.put("pagination", pagination);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		
	}
	@RequestMapping(value="/purchasereportyearly", method=RequestMethod.GET, produces= MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Map<String, Object>> getpurchasereportyearly(
			   @RequestParam(value="start_date") String strStartDate, 
			   @RequestParam(value="end_date") String strEndDate) throws ParseException{
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = simpleDateFormat.parse(strStartDate);
		Date endDate = simpleDateFormat.parse(strEndDate);
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println(strStartDate);
		System.out.println(strEndDate);
		
		map.put("reportyear", adminReportService.getListReportYearlyPurcase(startDate, endDate));
		 
		map.put("total_reportyear", adminReportService.getAllPurchaseMonthlyReportsTotal(startDate, endDate));
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK); 
		
	}
}
