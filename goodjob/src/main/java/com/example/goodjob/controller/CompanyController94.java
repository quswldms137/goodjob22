package com.example.goodjob.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dao.ICompanyListDao;
import com.example.goodjob.dto.CompanyDetailDto94;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/company")
public class CompanyController94 {
	//기업리스트
	@Autowired
	ICompanyListDao comListDao;
	
	@GetMapping("/companyList")
	public List<CompanyDetailDto94> companyInfo() {
		System.out.println(comListDao.getCompanyList());
		return comListDao.getCompanyList();
	}
	
	

	
	
	
	
	
	
}
