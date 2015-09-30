package com.kosign.wecafe.controller.admin;

import java.security.Principal;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosign.wecafe.entities.Category;
import com.kosign.wecafe.entities.Product;

@Controller
public class AdminController {

	@RequestMapping(value="/admin/access_denied")
	public String accessDeniedPage(ModelMap model, Principal principal){
		model.addAttribute("user", principal.getName());
		return "admin/access_denied";
	}
	
	@RequestMapping(value="/admin/session_expired")
	public String sessionExpired(ModelMap model, Principal principal){
		model.addAttribute("user", principal.getName());
		return "admin/session_expired";
	}
	
	@RequestMapping(value="/admin/login", method = RequestMethod.GET)
    public ModelAndView login(
    		@RequestParam(value = "error",required = false) String error,
    	    @RequestParam(value = "logout", required = false) String logout
    	    ){
		System.out.println("LOGGING");
		ModelAndView model = new ModelAndView();
		if (error != null) {
			System.out.println("INVALID Credentials provoide");
            model.addObject("error", "Invalid username and password!");
        }
 
        if (logout != null) {
        	System.out.println("Logged Out");
        	model.addObject("logout", "You have been logged out successfully.");
        }
        model.setViewName("admin/login");

		return model;
    }
	
	@RequestMapping(value="/admin/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
       Authentication auth = SecurityContextHolder.getContext().getAuthentication();
       if (auth != null){    
          new SecurityContextLogoutHandler().logout(request, response, auth);
       }
       return "redirect:/admin/login?logout";
    }
	
	@RequestMapping(value={"/admin/dashboard","/admin/","/admin/home"})
	public String dashboard(){
		return "admin/dashboard";
	}
	
	@RequestMapping(value="/admin/productlist")
	public String productlist(){
		return "admin/productlist";
	}
		
/*	@RequestMapping(value="/productadd")
	public String productadd(){
		return "admin/productadd";
	}*/
	
	@RequestMapping(value="/admin/categorylist")
	public String categorylist(){
		return "admin/categorylist";
	}
	
	@RequestMapping(value="/admin/categoryadd")
	public String categoryadd(){
		return "admin/categoryadd";
	}
	
	@RequestMapping(value="/admin/orderlist")
	public String orderlist(){
		return "admin/orderlist";
	}
	
	@RequestMapping(value="/admin/orderadd")
	public String orderadd(){
		return "admin/orderadd";
	}
	
	@RequestMapping(value="/admin/salelist")
	public String salelist(){
		return "admin/salelist";
	}
	
	@RequestMapping(value="/admin/saleadd")
	public String saleadd(){
		return "admin/saleadd";
	}
	
	@RequestMapping(value="/admin/supplierlist")
	public String supplierlist(){
		return "admin/supplierlist";
	}
	
	@RequestMapping(value="/admin/supplieradd")
	public String supplieradd(){
		return "admin/supplieradd";
	}
	
	@RequestMapping(value="/admin/userlist")
	public String userlist(){
		return "admin/userlist";
	}
	
	@RequestMapping(value="/admin/useradd")
	public String useradd(){
		return "admin/useradd";
	}
	
}
