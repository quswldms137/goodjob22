package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.goodjob.dto.CareerDto;

@Mapper
public interface CareerDao {
	
	public CareerDto careerWrite(CareerDto careerDto);

}