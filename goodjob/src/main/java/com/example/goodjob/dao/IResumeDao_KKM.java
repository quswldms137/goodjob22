package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.ResumeDetailCompanyDto_KKM;

@Mapper
public interface IResumeDao_KKM {

	public ResumeDetailCompanyDto_KKM getResume(@Param("resume_no") Long resume_no);
}
