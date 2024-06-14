package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.goodjob.dto.CompanyDto;

@Mapper
public interface ICompanyDao99 {
	public int regCompany(CompanyDto companyDto);
}
