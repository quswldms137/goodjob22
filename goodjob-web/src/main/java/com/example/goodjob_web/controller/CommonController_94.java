package com.example.goodjob_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/company94")
public class CommonController_94 {
	//기업정보 상세페이지 
	@RequestMapping("/companyDetail")
	public String companyDetail(@RequestParam("com_no") Long com_no, Model model) {
		model.addAttribute("com_no", com_no);
		System.out.println("com_no=================="+com_no);
		return "common/companyDetail";
	}
	
	//기업리스트 페이지
	@RequestMapping("/companyList")
	public String companyList() {
		return "common/companyList";
	}
	
	//채용공고리스트 페이지
	@RequestMapping("/employList")
	public String emplouList() {
		return "common/employList";
	}
}
