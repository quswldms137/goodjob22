package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.LicenseDto;

@Mapper
public interface ILicenseDao_JYC {

	public int deleteByResume_no(@Param("resume_no") Long resume_no);
	public List<LicenseDto> getLicense(@Param("resume_no") Long resume_no);
} 
