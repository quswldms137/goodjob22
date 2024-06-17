package com.example.goodjob_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//view controller
@Controller
@RequestMapping("/company")
public class CompanyController_KKM {

	@RequestMapping("/receiveResume")
	public String reveiveResume() {
		
		return"company/receiveResume";
	}
}
