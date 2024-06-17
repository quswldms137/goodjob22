package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.goodjob.dto.RecruitDto;

@Mapper
public interface IRecruitListDao94 {
	public List<RecruitDto> getRecruitListDto();
}

