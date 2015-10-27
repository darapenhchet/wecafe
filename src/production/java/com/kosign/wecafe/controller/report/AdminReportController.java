package com.kosign.wecafe.controller.report;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminReportController {

	@RequestMapping(value="/admin/sellreport", method=RequestMethod.GET)
	public String ListReportSell(){
		return "admin/InvioceSell";
	}
}
