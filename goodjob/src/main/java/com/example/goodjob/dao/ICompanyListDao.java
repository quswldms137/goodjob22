package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.CompanyDetailDto94;

@Mapper
public interface ICompanyListDao {
	//전체 기업 목록 페이지
	public List<CompanyDetailDto94> getCompanyList();
	
	//기업목록 페이지 필터 
	public List<CompanyDetailDto94> getFilterCompanyList(@Param("sectors") String sectors,
			  											 @Param("location") String location,
			  											 @Param("com_type") String com_type);
	
}
