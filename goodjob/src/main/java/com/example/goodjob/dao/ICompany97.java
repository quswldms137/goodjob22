package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.CompanyDetailDto97;
import com.example.goodjob.dto.MemRecruitDto;
import com.example.goodjob.dto.MemRecruitJoinDto;
import com.example.goodjob.dto.RecruitDto;
import com.example.goodjob.dto.ResumeDto;

@Mapper
public interface ICompany97 {

	public int CompanyDetailWrite(CompanyDetailDto97 companyDetailDto);
	
	public CompanyDetailDto97 getcompanyinfo(@Param("com_no") Long com_no);
	
	//컴퍼니 디테일에 키값이 있는지 조회
	public CompanyDetailDto97 getkeyvalue(@Param("com_no") Long com_no);
	
	public int updateCompanyDetail(CompanyDetailDto97 companyDetailDto);
	
	//특정 채용공고 정보 조회
	public RecruitDto findByRecruit_no(@Param("recruit_no") Long recruit_no);
	
	public List<RecruitDto> getRecruitList(@Param("com_no") Long com_no);
	public List<MemRecruitDto> getMemRecruitList(@Param("recruit_no") Long recruit_no);
	public ResumeDto getResumeDto(@Param("resume_no") Long resume_no);
	public String getMem_name(@Param("mem_no") Long mem_no);
	
}
