package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.ServiceQuestionDto;

@Mapper
public interface IServiceQuestionDao {
	
	public List<ServiceQuestionDto> findByMem_no(@Param("mem_no") Long mem_no);
	public int deleteQna(@Param("cs_no") Long cs_no);

}