package com.example.goodjob.dao;

import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.CSkillDto;

@Mapper
public interface ICSkillDao_JYC {

	public List<CSkillDto> findAll();
	public Set<String> getSkillName();
	public Long getCount(@Param("skill_name") String skill_name);
	public int deleteByRecruit_no(@Param("recruit_no") Long recruit_no);
}
