package com.example.goodjob.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dao.ICompanyInfoDetailDao;
import com.example.goodjob.dto.CompanyDetailDto94;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/com-detail")
public class CompanyInfoDetail_94 {
	@Autowired
	ICompanyInfoDetailDao comInfoDetailDao;
	
	//기업정보 상세 조회 
	@GetMapping("/companyInfo")
	public CompanyDetailDto94 companyInfo(@RequestParam("com_no") Long com_no) {
		System.out.println("com_no==========="+com_no);
		System.out.println(comInfoDetailDao.getCompanyDetail(com_no));
		return comInfoDetailDao.getCompanyDetail(com_no);
	}
}
