package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.SkillDto;

@Mapper
public interface SkillDao {

	public int skillWrite(SkillDto skillDto);
	
	/* 이력서 디테일에 들어가는 보유스킬 정보 */
	public SkillDto getSkillDetail(@Param("resume_no") Long resume_no);
}
