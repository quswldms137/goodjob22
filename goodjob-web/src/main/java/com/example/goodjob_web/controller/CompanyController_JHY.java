package com.example.goodjob_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company")
public class CompanyController_JHY { // view
	
	
	
	
	@RequestMapping({"", "/index"})
	public String main() {
		return "company/index";
	}
	
	@RequestMapping("/employManage")
	public String employManage() {
		
		
		
		return "company/employManage";
	}
	
	@RequestMapping("/employWrite")
	public String employWrite() {
		return "company/employWrite";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
