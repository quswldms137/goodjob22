package com.example.goodjob.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/company")
public class CompanyController_JHY {
	
	@GetMapping("/index")
	public String main() {
		
		
		
		return "";
	}
	
}
