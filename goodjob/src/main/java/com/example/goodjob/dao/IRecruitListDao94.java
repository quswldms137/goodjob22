package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.RecruitDto;

@Mapper
public interface IRecruitListDao94 {
	public List<RecruitDto> getRecruitListDto(@Param("com_no") Long com_no);
}

