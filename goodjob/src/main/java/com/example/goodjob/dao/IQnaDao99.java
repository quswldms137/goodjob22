package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.goodjob.dto.ServiceQuestionDto;

@Mapper
public interface IQnaDao99 {

	public int regQuestion(ServiceQuestionDto serviceQuestionDto);
}
