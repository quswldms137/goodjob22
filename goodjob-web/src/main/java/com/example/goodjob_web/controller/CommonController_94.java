package com.example.goodjob_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company94")
public class CommonController_94 {
	//기업정보 상세페이지 
	@RequestMapping("/companyDetail")
	public String companyDetail() {
		return "common/companyDetail";
	}
}
