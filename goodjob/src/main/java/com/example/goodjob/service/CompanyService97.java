package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.ICompany97;
import com.example.goodjob.dto.CompanyDetailDto97;

@Service
public class CompanyService97 {

	@Autowired
	private ICompany97 icompany97;
	
	public int companyDetailWriteService(CompanyDetailDto97 companydetail) {
		
		return icompany97.CompanyDetailWrite(companydetail);
	}
	
	
	
}
