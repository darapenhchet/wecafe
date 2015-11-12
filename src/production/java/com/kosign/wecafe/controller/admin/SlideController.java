package com.kosign.wecafe.controller.admin;

import java.security.Principal;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosign.wecafe.entities.Slide;
import com.kosign.wecafe.entities.User;
import com.kosign.wecafe.services.SlideService;
import com.kosign.wecafe.services.UserService;

@Controller
public class SlideController {

	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SlideService slideService;
	
	@RequestMapping(value="/admin/slides")
	public String listAllSlides(Map<String , Object> model){
		return "admin/slidelist";		
	}
	
	@RequestMapping(value="/admin/slideadd")
	public String categoryadd(){
		return "admin/slideadd";
	}
	
	@RequestMapping(value="/admin/slide/add", method=RequestMethod.POST)
	public  @ResponseBody Boolean addNewCategory(Slide slide, Principal principal){
		
		User user = userService.findUserByUsername(principal.getName());
        
        slide.setCreatedBy(user);
        slide.setCreatedDate(new Date());
        slide.setStatus(true);
        
		System.out.println(user.getUsername());
		return slideService.addNewSlide(slide);
		
	}
}
