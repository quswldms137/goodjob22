package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.MemberDto;

@Mapper
public interface IMemberDao93 {
	
	public MemberDto getMemberDetail(@Param("mem_no") Long mem_no);

}
