package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.RecruitAllDto94;
import com.example.goodjob.dto.RecruitDto;

@Mapper
public interface IRecruitListDao94 {
	//해당기업의 채용공고 리스트 
	public List<RecruitDto> getRecruitListDto(@Param("com_no") Long com_no);

	//전체채용공고리스트
	public List<RecruitAllDto94> getAllRecruitDto();
	
}

