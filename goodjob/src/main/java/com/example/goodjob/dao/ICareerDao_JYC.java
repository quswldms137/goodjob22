package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ICareerDao_JYC {

	public int deleteByResume_no(@Param("resume_no") Long resume_no);
}
