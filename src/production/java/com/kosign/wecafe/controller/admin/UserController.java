package com.kosign.wecafe.controller.admin;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosign.wecafe.services.UserService;

@Controller
public class UserController {

	@Inject
	UserService userService;
	@RequestMapping(value="/admin/userlist")
	public String getAllUsers(Map<String, Object> model){
		model.put("users", userService.getAllUsers());
		return "admin/userlist";
	}
	
	@RequestMapping(value="/admin/useradd")
	public String useradd(){
		return "admin/useradd";
	}
}
