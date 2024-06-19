package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.CompanyDetailDto97;
import com.example.goodjob.dto.MemRecruitDto;
import com.example.goodjob.dto.RecruitDto;

@Mapper
public interface ICompany97 {

	public int CompanyDetailWrite(CompanyDetailDto97 companyDetailDto);
	
	public CompanyDetailDto97 getcompanyinfo(@Param("com_no") Long com_no);
	
	//컴퍼니 디테일에 키값이 있는지 조회
	public CompanyDetailDto97 getkeyvalue(@Param("com_no") Long com_no);
	
	public int updateCompanyDetail(CompanyDetailDto97 companyDetailDto);
	
	//특정 채용공고 정보 조회
	public RecruitDto findByRecruit_no(@Param("recruit_no") Long recruit_no);
	//지원받은 이력서 리스트 
	public List<MemRecruitDto> findrecruit_no(@Param("recruit_no") Long recruit_no);
}
