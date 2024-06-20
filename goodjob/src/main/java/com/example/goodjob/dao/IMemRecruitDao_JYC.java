package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface IMemRecruitDao_JYC {

	public int deleteByResume_no(@Param("mem_no") Long mem_no);
	public int deleteByRecruit_no(@Param("recruit_no") Long recruit_no);
}
