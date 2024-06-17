package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.goodjob.dto.CSkillDto;

@Mapper
public interface ICSkillDao_JYC {

	public List<CSkillDto> findAll();
}
