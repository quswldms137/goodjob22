package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface IServiceRequestDao_JYC {

	public int deleteByCs_no(@Param("cs_no") Long cs_no);
}
