package com.example.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dto.CompanyDetailDto97;
import com.example.goodjob.dto.CompanyDto;
import com.example.goodjob.dto.RecruitDetailDto;
import com.example.goodjob.dto.RecruitDto;
import com.example.goodjob.service.RecruitCompanyDetailService;
import com.example.goodjob.service.RecruitService93;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/recruit")
public class RecruitController93 {

	@Autowired
	private RecruitService93 recruitService;
	
	@Autowired
	private RecruitCompanyDetailService companyDetailService;
	
	@GetMapping("/detail")
	public RecruitDetailDto recruitDetail(@RequestParam("recruit_no") Long recruit_no,
			@RequestParam("com_no") Long com_no,
			@RequestParam("com_detail_no") Long com_detail_no) {
		
		RecruitDto recruitDto = recruitService.recruitDetailService(recruit_no, com_no);
		CompanyDto companyDto = companyDetailService.getCompanyService(com_no);
		CompanyDetailDto97 companyDto2 = companyDetailService.getCompanyService2(com_detail_no, com_no);
		
		return new RecruitDetailDto(recruitDto, companyDto, companyDto2);
	}
	
}
