package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.RecruitDto;

@Mapper
public interface IRecruitDao93 {
	
	public RecruitDto recruitDetail(@Param("recruit_no") Long recruit_no, @Param("com_no") Long com_no);
	

}
