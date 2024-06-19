package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.CareerDto;

@Mapper
public interface ICareerDao_JYC {

	public int deleteByResume_no(@Param("resume_no") Long resume_no);
	public List<CareerDto> getCareer(@Param("resume_no") Long resume_no);
}
