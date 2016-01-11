package com.kosign.wecafe.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.poi.hssf.model.Model;
import org.apache.poi.hssf.util.HSSFColor.RED;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.kosign.wecafe.entities.ImportDetail;
import com.kosign.wecafe.entities.Pagination;
import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.entities.RequestStock;
import com.kosign.wecafe.entities.Supplier;
import com.kosign.wecafe.forms.ImportForm;
import com.kosign.wecafe.services.ImportService;
import com.kosign.wecafe.services.ProductService;
import com.kosign.wecafe.services.RequestService;
import com.kosign.wecafe.services.RequestServiceImp;
import com.kosign.wecafe.services.SupplierService;

@Controller
public class RequestStockController {
	
	@Inject RequestService requestService;
		
	@RequestMapping(value="/admin/list_request_stock_detail", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Map<String, Object>> listRequestStockDetail(@RequestParam(name="req_id",defaultValue="")String reqId,Pagination pagination)	{
		
		String reqId1="";
		if(reqId.equals("0") || reqId.equals("")){
			reqId1="";
		}else{
			reqId1=reqId;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("RSD", requestService.listRequestDetail(reqId1,pagination));
		map.put("RS",requestService.listRequestStock());
		pagination.setTotalCount((long) requestService.count(reqId));
		pagination.setTotalPages(pagination.totalPages());
		map.put("pagination",pagination);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		/*
		HashMap<String, Object> model = new HashMap<String, Object>();
		model.put("RSD", requestService.listRequestDetail(reqId1,pagination));
		model.put("RS",requestService.listRequestStock());
		return  model;*/
	}

}
