package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface INoticeDao_JYC {

	public int deleteByMem_no(@Param("mem_no") Long mem_no);
}
