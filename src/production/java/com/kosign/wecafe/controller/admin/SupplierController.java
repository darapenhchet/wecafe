package com.kosign.wecafe.controller.admin;

import java.security.Principal;
import java.util.Date;
import java.util.Map;

import javax.inject.Inject;

import org.hibernate.jpa.criteria.predicate.PredicateImplementor;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosign.wecafe.entities.Supplier;
import com.kosign.wecafe.services.SupplierService;

@Controller
public class SupplierController {
	
	@Inject
	private SupplierService SupplierService;
	
	@RequestMapping(value = "/admin/supplierlist", method = RequestMethod.GET)
	public String listAllSuppliers(Map<String, Object> model) {
		model.put("suppliers", SupplierService.getAllSupplier());
		System.out.println(SupplierService.getAllSupplier());
		return "admin/supplierlist";
	}
	@RequestMapping(value="/admin/supplieradd", method = RequestMethod.GET)
	public String SupplierAdd(){
		return "admin/supplieradd";
	}
	
	@RequestMapping(value="/admin/addSupplier", method=RequestMethod.POST, consumes= MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Boolean addNewSupplier(@RequestBody Supplier supplierForm, Principal pricipal){
		
		try {
			Supplier suppliers = new Supplier();
			suppliers.setCreatedBy(pricipal.getName());
			suppliers.setCreatedDate(new Date());
			suppliers.setLastUpdatedBy(pricipal.getName());
			suppliers.setLastUpdatedDate(new Date());
			suppliers.setSupplierAddress(supplierForm.getSupplierAddress());
			suppliers.setSupplierEmail(supplierForm.getSupplierEmail());
			suppliers.setSupplierName(supplierForm.getSupplierName());
			suppliers.setSupplierNumber(supplierForm.getSupplierNumber());
			return SupplierService.saveSupplier(suppliers);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}
	
	@RequestMapping(value="/admin/updateSupplier", method=RequestMethod.POST, consumes= MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Boolean updateSupplier(@RequestBody Supplier supplierForm, Principal principal){
		
		try {
			Supplier suppliers = new Supplier();
			suppliers.setCreatedBy(principal.getName());
			suppliers.setCreatedDate(new Date());
			suppliers.setLastUpdatedBy(principal.getName());
			suppliers.setLastUpdatedDate(new Date());
			suppliers.setSupplierAddress(supplierForm.getSupplierAddress());
			suppliers.setSupplierEmail(supplierForm.getSupplierEmail());
			suppliers.setSupplierName(supplierForm.getSupplierName());
			suppliers.setSupplierNumber(supplierForm.getSupplierNumber());
			return SupplierService.updateSupplier(suppliers);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}
	
}
