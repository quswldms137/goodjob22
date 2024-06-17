package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.SkillDto;

@Mapper
public interface ISkillDao_JYC {

	public List<SkillDto> findByResume_no(@Param("resume_no") Long resume_no);
	public List<Long> getSkill_no(@Param("resume_no") Long resume_no);
	public String getSkillName(@Param("skill_no") Long skill_no);
}
