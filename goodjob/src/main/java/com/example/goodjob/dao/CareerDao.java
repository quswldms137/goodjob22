package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.CareerDto;

@Mapper
public interface CareerDao {
	
	public int careerWrite(CareerDto careerDto);
	
	/* 이력서 디테일에 들어가는 커리어정보 */
	public CareerDto getCareerDetail(@Param("resume_no") Long resume_no);

}
