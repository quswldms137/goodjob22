package com.example.goodjob_web.controllercompany;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping("/interestMemberResumeDetail/{resume_no}")
	public String interestResumeDetail(@PathVariable("resume_no") Long resume_no, Model model) {	
	
		model.addAttribute("resume_no", resume_no);
		
		return"company/interestMemberResumeDetail";
	}
}
