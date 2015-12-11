package com.kosign.wecafe.controller.admin.rest;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kosign.wecafe.services.SellService;

@RestController
@RequestMapping("/admin/rest")
public class SaleRestController {


	@Autowired
	SellService sellService;
	
	@RequestMapping(value="/sales/daily", method=RequestMethod.GET, produces= MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Map<String, Object>> getAllSalesDailyReports(@RequestParam(value="start_date") String startDate, 
														   @RequestParam(value="end_date") String endDate){
		Map<String, Object> map = new HashMap<String, Object>();
		/*
			Pagination pagination = new Pagination();
			pagination.setCurrentPage(currentPage);
			pagination.setPerPage(limit);
			System.out.println(pagination.getPerPage());
			map.put("SALES", sellService.getSellAllList(pagination));
			System.out.println(sellService.getAllSellCount());
			pagination.setTotalCount(sellService.getAllSellCount());
			pagination.setTotalPages(pagination.totalPages());
			map.put("PAGINATION", pagination);
		*/
		System.out.println(startDate);
		System.out.println(endDate);
		map.put("sales", sellService.getAllSaleDailyReports());
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	@RequestMapping(value="/sales/monthly", method=RequestMethod.GET, produces= MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Map<String, Object>> getAllSalesMonthlyReports(@RequestParam(value="start_date") String startDate, 
														   @RequestParam(value="end_date") String endDate){
		Map<String, Object> map = new HashMap<String, Object>();
		/*
			Pagination pagination = new Pagination();
			pagination.setCurrentPage(currentPage);
			pagination.setPerPage(limit);
			System.out.println(pagination.getPerPage());
			map.put("SALES", sellService.getSellAllList(pagination));
			System.out.println(sellService.getAllSellCount());
			pagination.setTotalCount(sellService.getAllSellCount());
			pagination.setTotalPages(pagination.totalPages());
			map.put("PAGINATION", pagination);
		*/
		System.out.println(startDate);
		System.out.println(endDate);
		map.put("sales", sellService.getAllSaleMonthlyReports());
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
}
