package com.example.goodjob.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dao.ICompanyInfoDetailDao;
import com.example.goodjob.dto.CompanyDetailDto94;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/com-detail")
public class CompanyInfoDetail_94 {
	@Autowired
	ICompanyInfoDetailDao comInfoDetailDao;
	
	//기업정보 조회 
	@GetMapping("/companyInfo")
	public List<CompanyDetailDto94> companyInfo() {
		System.out.println(comInfoDetailDao.getCompanyDetail());
		return comInfoDetailDao.getCompanyDetail();
	}
}
