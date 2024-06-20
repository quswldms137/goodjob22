package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.ResumeAndSkillDto;
import com.example.goodjob.dto.ResumeDto;

@Mapper
public interface IResumeDao_JHY {

	// mem_no 로 이력서 조회
	public ResumeAndSkillDto findByMem_no(@Param("mem_no") Long mem_no);
	
	// resume_no 로 이력서 조회해서 등록된 skill 정보 받아오기
	public List<String> findSk_nameWithResume_no(@Param("resume_no") Long resume_no);
	
	// 대표 이력서만 받아오기
	public List<ResumeDto> findMainResume(); 
}
