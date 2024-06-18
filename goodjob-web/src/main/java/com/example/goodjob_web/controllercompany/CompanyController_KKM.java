package com.example.goodjob_web.controllercompany;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/company")
public class CompanyController_KKM {
		
	@RequestMapping("/info")
	public String companyInfo() {
				
		return"company/info";
	}
	
	@RequestMapping("/infoModify")
	public String companyInfoModify() {
		
		return"company/infoModify";
	}
	
	
	@RequestMapping("/receiveResume")
	public String reveiveResume() {
		
		return"company/receiveResume";
	}
}
