package com.example.goodjob_web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	
	@RequestMapping("/employUpdate")
	public String employUpdate(@RequestParam("recruit_no") String recruit_no, Model model) {
		
		model.addAttribute("recruit_no", recruit_no);
		
		return "company/employUpdate";
	}
	
	@RequestMapping("/interestMemberList")
	public String interestMemberList() {
		
		
		
		return "company/interestMemberList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
