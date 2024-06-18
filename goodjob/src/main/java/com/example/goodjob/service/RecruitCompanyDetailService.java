package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.ICompanyDetailDao;
import com.example.goodjob.dto.CompanyDetailDto97;
import com.example.goodjob.dto.CompanyDto;

@Service
public class RecruitCompanyDetailService {
	
	@Autowired
	private ICompanyDetailDao dao;
	
	public CompanyDto getCompanyService(Long com_no) {
		
		return dao.RecruitDetailCompany(com_no);
	}
	
	public CompanyDetailDto97 getCompanyService2(Long com_detail_no, Long com_no) {
		
		return dao.RecruitDetailCompany2(com_detail_no, com_no);
	}

}
