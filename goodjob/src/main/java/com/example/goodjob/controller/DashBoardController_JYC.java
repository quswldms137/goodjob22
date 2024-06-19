package com.example.goodjob.controller;

import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.service.CompanyService_JYC;
import com.example.goodjob.service.UserService_JYC;

@CrossOrigin("http://localhost:9991/")
@RestController
@RequestMapping("/api/dashboard")
public class DashBoardController_JYC {

	private UserService_JYC userService;
	private CompanyService_JYC companyService;
	
	public DashBoardController_JYC(UserService_JYC userService, CompanyService_JYC companyService) {
		this.userService = userService;
		this.companyService = companyService;
	}
	
	@GetMapping("/user")
	public ResponseEntity<Map<List<String>, List<Long>>> getMonthlyUser(){
		
		Map<List<String>, List<Long>> map = userService.getMonthlyUser();
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(map);
	}
	
	@GetMapping("/money")
	public ResponseEntity<Map<List<String>, List<Long>>> getCompanyMoney(){
		
		Map<List<String>, List<Long>> map = companyService.getCompanyMoney();
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(map);
	}
}
