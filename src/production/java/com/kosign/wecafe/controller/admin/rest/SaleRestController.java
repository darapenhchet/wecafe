package com.kosign.wecafe.controller.admin.rest;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kosign.wecafe.entities.Pagination;
import com.kosign.wecafe.services.SellService;

@RestController
@RequestMapping("/admin/rest")
public class SaleRestController {


	@Autowired
	SellService sellService;
	
	@RequestMapping(value="/sales", method=RequestMethod.POST, produces= MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Map<String, Object>> getAllSales(Pagination pagination){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("PAGINATION", pagination);
		map.put("SALES", sellService.getSellAllList(pagination));
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	/*@RequestMapping(value="/sales/")
	public Map<String, Object> getAllSales(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("PAGINATION","PAGINATION");
		map.put("SALES", sellService.getSellAllList(0,10));
		return map;
	}*/
}
