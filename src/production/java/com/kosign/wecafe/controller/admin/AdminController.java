package com.kosign.wecafe.controller.admin;

import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosign.wecafe.entities.Category;
import com.kosign.wecafe.entities.Product;

@Controller
@RequestMapping(value="/admin")
public class AdminController {

	@RequestMapping(value={"/dashboard","/","/home"})
	public String dashboard(){
		return "admin/dashboard";
	}
	
	@RequestMapping(value="/productlist")
	public String productlist(){
		return "admin/productlist";
	}
		
	@RequestMapping(value="/productadd")
	public String productadd(){
		return "admin/productadd";
	}
	
	@RequestMapping(value="/categorylist")
	public String categorylist(){
		return "admin/categorylist";
	}
	
	@RequestMapping(value="/categoryadd")
	public String categoryadd(){
		return "admin/categoryadd";
	}
	
	@RequestMapping(value="/orderlist")
	public String orderlist(){
		return "admin/orderlist";
	}
	
	@RequestMapping(value="/orderadd")
	public String orderadd(){
		return "admin/orderadd";
	}
	
	@RequestMapping(value="/salelist")
	public String salelist(){
		return "admin/salelist";
	}
	
	@RequestMapping(value="/saleadd")
	public String saleadd(){
		return "admin/saleadd";
	}
	
	@RequestMapping(value="/supplierlist")
	public String supplierlist(){
		return "admin/supplierlist";
	}
	
	@RequestMapping(value="/supplieradd")
	public String supplieradd(){
		return "admin/supplieradd";
	}
	
	@RequestMapping(value="/userlist")
	public String userlist(){
		return "admin/userlist";
	}
	
	@RequestMapping(value="/useradd")
	public String useradd(){
		return "admin/useradd";
	}
	
}
