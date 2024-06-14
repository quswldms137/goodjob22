package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.ICompanyDao99;
import com.example.goodjob.dto.CompanyDto;

@Service
public class CompanyService99 {

	@Autowired
	private ICompanyDao99 iCompanyDao;
	
	public int regCompany(CompanyDto companyDto) {
		CompanyDto company = new CompanyDto();
		company.setUsername(companyDto.getUsername());
		company.setCom_name(companyDto.getCom_name());
		company.setCom_type(companyDto.getCom_type());
		company.setCom_ceo(companyDto.getCom_ceo());
		company.setCom_addr(companyDto.getCom_addr());
		company.setCom_companynum(companyDto.getCom_companynum());
		company.setCom_tel(companyDto.getCom_tel());
		company.setCom_email(companyDto.getCom_email());
		
		int result = iCompanyDao.regCompany(companyDto);
		return result;
	}
	
}
