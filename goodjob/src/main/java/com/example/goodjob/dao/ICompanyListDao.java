package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.CompanyDetailDto94;

@Mapper
public interface ICompanyListDao {
	/**
     * 전체 기업 목록을 반환합니다.
     * @return 기업 상세 정보 목록
     */
	public List<CompanyDetailDto94> getCompanyList();
	
	/**
     * 필터 조건에 맞는 기업 목록을 반환합니다.
     * @param sectors 직종
     * @param location 지역
     * @param com_type 기업형태
     * @return 필터 조건에 맞는 기업 상세 정보 목록
     */
	public List<CompanyDetailDto94> getFilterCompanyList(@Param("sectors") String sectors,
			  											 @Param("location") String location,
			  											 @Param("com_type") String com_type);
	/**
     * 검색어에 맞는 기업 목록을 반환합니다.
     * @param searchQuery 검색어
     * @return 검색어에 맞는 기업 상세 정보 목록
     */
	public List<CompanyDetailDto94> getSearchCompany(@Param("query") String searchQuery);
}
