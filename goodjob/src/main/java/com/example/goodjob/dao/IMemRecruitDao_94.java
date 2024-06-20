package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface IMemRecruitDao_94 {
	// 채용공고 지원하기 
	public int nowApply(@Param("resume_no") Long resume_no, @Param("recruit_no") Long recruit_no);
	
	//대표 이력서 번호 찾는 함수
	public Long getResumeNum(@Param("mem_no") Long mem_no); 
}
