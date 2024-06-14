package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.goodjob.dto.SkillDto;

@Mapper
public interface SkillDao {

	public SkillDto skillWrite(SkillDto skillDto);
	
}
