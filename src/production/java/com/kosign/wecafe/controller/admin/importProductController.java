package com.kosign.wecafe.controller.admin;

import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosign.wecafe.entities.ImportDetail;
import com.kosign.wecafe.entities.ImportProduct;
import com.kosign.wecafe.entities.Product;
import com.kosign.wecafe.entities.Supplier;
import com.kosign.wecafe.entities.User;
import com.kosign.wecafe.forms.ImportForm;
import com.kosign.wecafe.services.ImportService;
import com.kosign.wecafe.services.ImportServiceImp;
import com.kosign.wecafe.services.ProductService;
import com.kosign.wecafe.services.SupplierService;
import com.kosign.wecafe.services.UserService;

@Controller
public class importProductController {
	
	@Inject ImportService importService;
	
	@Inject ProductService productService;
	
	@Inject SupplierService supplierService;
	
	@RequestMapping(value="/admin/importlist", method=RequestMethod.GET)
	public String listAllImpProduct(Map<String, Object>model){
//		model.put("supplier",importServiceImp.listAllSupplier());
		return "admin/importlist";
	}
	
	@RequestMapping(value="/admin/searchproduct", method=RequestMethod.POST)
	public @ResponseBody List<Product> searchProductName(){
		return importService.listAllProduct();
	}
	
	@RequestMapping(value="/admin/searchsupplier", method=RequestMethod.POST)
	public @ResponseBody List<Supplier> searchSupplierName(){
		return importService.listAllSupplier();
	}
	
	@RequestMapping(value="/admin/importadd", method=RequestMethod.GET)
	public String impProductAdd(){
		return "admin/importadd";
	}
	
	@RequestMapping(value="/admin/addImport", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Boolean saveImpProduct(@RequestBody ImportForm importForm)	{
		ImportDetail importDetails = new ImportDetail();
		try {
			Product product = productService.findProductById(importForm.getProId());
		    //Supplier supplier = supplierService.findSupplierById(importForm.getSupplierId());
			importDetails.setProduct(product);
			
			importDetails.setProQty(importForm.getQuantity());
			importDetails.setUnitPrice(importForm.getUnitPrice());
			importDetails.setProStatus(true);
			importDetails.setSupId(importForm.getSupplierId());
			return importService.saveImportPro(importDetails);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}
	
	

}
