package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.CompanyDetailDto97;
import com.example.goodjob.dto.CompanyDto;

@Mapper
public interface ICompanyDetailDao {
	
	/*공고 상세보기에 들어가는 기업정보*/
	public CompanyDto RecruitDetailCompany(@Param("com_no") Long com_no);
	
	/*공고 상세보기에 들어가는 기업정보 (다른dto)*/
	public CompanyDetailDto97 RecruitDetailCompany2(@Param("com_detail_no") Long com_detail_no, @Param("com_no") Long com_no);

}
