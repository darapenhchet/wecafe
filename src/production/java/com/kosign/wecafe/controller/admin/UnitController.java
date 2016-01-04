package com.kosign.wecafe.controller.admin;

import java.security.Principal;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosign.wecafe.entities.Unit;
import com.kosign.wecafe.forms.UnitForm;
import com.kosign.wecafe.services.UnitService;

@Controller
public class UnitController {

	@Inject UnitService unitService;
	
	@RequestMapping(value="/admin/unitlist")
	public String getListAllUnit(Map<String, Object>model){
		model.put("units", unitService.getAllUnits());
		return "admin/unitlist";
	}
	@RequestMapping(value="/admin/unitadd")
	public String setunit(Map<String, Object>model){
		
		model.put("units", unitService.getAllUnits());
		return "admin/unitadd";
	}
	
	@RequestMapping(value="/admin/updateunit/{unitid}",method = RequestMethod.GET)
	public String updateunit(@PathVariable("unitid") Long unitids ,Map<String, Object>model){
		System.out.println(" unitids = " + unitids);
		model.put("findunit", unitService.findUnit(unitids));		
		
		return "admin/unitupdate";
	}
	
	@RequestMapping(value="/admin/addnewunit", method=RequestMethod.POST)
	public  @ResponseBody Boolean addNewunit(UnitForm form, Principal principal, HttpServletRequest request){
		
		
		Unit unit = new Unit();
		unit.setUnitName(form.getUnitName());
		unit.setQty(form.getUnitqty());
		unit.setTo(form.getUnittype());
		
		return unitService.addNewUnit(unit); 
		
	}
}
