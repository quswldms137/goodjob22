package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.goodjob.dto.ResumeDto;

@Mapper
public interface ResumeDao {
	
	public ResumeDto resumeWrite(ResumeDto resumeDto);

}
