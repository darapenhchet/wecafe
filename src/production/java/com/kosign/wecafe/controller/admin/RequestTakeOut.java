/*package com.kosign.wecafe.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.stat.QueryStatistics;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosign.wecafe.forms.ImportForm;

@Controller
public class RequestTakeOut {


	@RequestMapping(value="/admin/takeouts", method=RequestMethod.GET)
	public String listRequestTakeOut(Map<String, Object>model){
		System.out.println("jasdfjklajfasjfjasdlkfjasdkl");
		return "admin/takeoutlist";
	}
	
	//  /api/admin/takeouts
	
	@RequestMapping(value="/api/admin/takeouts", method= RequestMethod.GET )
	public @ResponseBody ResponseEntity<Map<String, Object>> listRequestTakeOut(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("error", "9999");
		map.put("message", "LIST TAKES OUTS SUCCESSFULLY.");
		map.put("take_outs", "LIST TAKES OUTS");
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	// GET , POST, PUT, DELETE
	@RequestMapping(value="/admin/takeout", method=RequestMethod.GET)
	public String listRequestTakeAdd(){
		return "admin/takeoutadd";
	}
	
	
	@RequestMapping(value="/admin/takeout", method= RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE, produces= MediaType.APPLICATION_JSON_VALUE )
	public @ResponseBody Boolean saveRequestTakeOut(@RequestBody List<ImportForm> importForm){
		
		return null;
	}
	
	@RequestMapping(value="/admin/takeout", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE, produces= MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Boolean updateRequestTakeOut(@RequestBody List<ImportForm> importForm){
		return null;
	}
}
*/