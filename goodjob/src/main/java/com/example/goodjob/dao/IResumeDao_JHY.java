package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.ResumeDto;

@Mapper
public interface IResumeDao_JHY {

	// mem_no 로 이력서 조회
	public ResumeDto findByMem_no(@Param("mem_no") Long mem_no);
	
}
