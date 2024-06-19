package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.MemberDto;

@Mapper
public interface IMemberDao_KKM {

	public Long getMem_no(@Param("resume_no") Long resume_no);
	public MemberDto getMemberDto(@Param("mem_no") Long mem_no);
}
