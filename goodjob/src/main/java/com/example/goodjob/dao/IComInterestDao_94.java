package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface IComInterestDao_94 {
	// 관심기업 등록 메서드
	public int addInterestCompany(@Param("mem_no") Long mem_no, @Param("com_no") Long com_no);
	
}
