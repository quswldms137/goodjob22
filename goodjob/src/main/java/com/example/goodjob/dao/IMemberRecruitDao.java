package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface IMemberRecruitDao {

	/* 구직자 공고에 지원하기(지원하기 데이터베이스에 등록) */
	public int nowApply(@Param("resume_no") Long resume_no, @Param("recruit_no") Long recruit_no);
	
}
