package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.CompanyDetailDto;

@Mapper
public interface ICompanyDetailDao_JYC {

	public CompanyDetailDto findByCom_no(@Param("com_no") Long com_no);
}
