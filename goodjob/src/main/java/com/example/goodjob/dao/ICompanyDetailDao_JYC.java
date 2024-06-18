package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.CompanyDto_JYC;

@Mapper
public interface ICompanyDetailDao_JYC {

	public CompanyDto_JYC findByCom_no(@Param("com_no") Long com_no);
	public int deleteByCom_no(@Param("com_no") Long com_no);
}
