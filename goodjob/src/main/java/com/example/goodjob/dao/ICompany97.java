package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.CompanyDetailDto97;

@Mapper
public interface ICompany97 {

	public int CompanyDetailWrite(CompanyDetailDto97 companyDetailDto);
	
	public CompanyDetailDto97 getcompanyinfo(@Param("com_no") Long com_no);
}
