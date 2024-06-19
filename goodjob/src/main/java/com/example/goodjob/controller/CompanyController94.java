package com.example.goodjob.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dao.ICompanyListDao;
import com.example.goodjob.dto.CompanyDetailDto94;
import com.example.goodjob.dto.RecruitAllDto94;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/company")
public class CompanyController94 {
	//기업전체리스트
	@Autowired
	ICompanyListDao comListDao;
	
	@GetMapping("/companyList")
	public List<CompanyDetailDto94> companyInfo() {
		System.out.println(comListDao.getCompanyList());
		return comListDao.getCompanyList();
	}
	
	//기업 필터(직무/지역/기업형태)
	@GetMapping("/filterList")								//필터링위해 파라미터를 선택적으로 받기 
	public List<CompanyDetailDto94> getFilterCompanyList(@RequestParam(value = "sectors", required = false) String sectors,
													     @RequestParam(value = "location", required = false) String location,
													     @RequestParam(value = "com_type", required = false) String com_type){
		System.out.println("필터채용공고리스트:" + comListDao.getFilterCompanyList(sectors, location, com_type));
		return comListDao.getFilterCompanyList(sectors, location, com_type);
	}
	
	//기업 검색창 
	@GetMapping("/searchCompany")
	public List<CompanyDetailDto94> getSearchCompany(@RequestParam("query") String searchQuery) {
		System.out.println(comListDao.getSearchCompany(searchQuery));
		return comListDao.getSearchCompany(searchQuery);
	}
}
