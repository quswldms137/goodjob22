package com.example.goodjob_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employ")
public class CommonController93 {

	@RequestMapping("/detail")
	public String employDetail() {
		
		return "common/recruitDetail";
	}
	
}
