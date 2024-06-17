package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.EducationDto;

@Mapper
public interface EducationDao {

	public int educationWrite(EducationDto educationDto);
	
	/* 이력서 디테일에 들어가는 학력정보 */
	public EducationDto getEducationDetail(@Param("resume_no") Long resume_no);
	
}
