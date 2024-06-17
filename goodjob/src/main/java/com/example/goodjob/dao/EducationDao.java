package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.goodjob.dto.EducationDto;

@Mapper
public interface EducationDao {

	public int educationWrite(EducationDto educationDto);
	
}
