package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.goodjob.dto.CompanyDetailDto97;

@Mapper
public interface ICompany97 {

	public int CompanyDetailWrite(CompanyDetailDto97 companyDetailDto);
}
