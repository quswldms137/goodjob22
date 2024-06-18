package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface IScrapRecruitDao_94 {
	// 채용공고 스크랩 
	public int addScrap(@Param("mem_no") Long mem_no, @Param("recruit_no") Long recruit_no);
	
}
