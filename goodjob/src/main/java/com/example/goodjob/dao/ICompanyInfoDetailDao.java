package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.CompanyDetailDto94;

@Mapper
public interface ICompanyInfoDetailDao {
	public CompanyDetailDto94 getCompanyDetail(@Param("com_no") Long com_no);
}
