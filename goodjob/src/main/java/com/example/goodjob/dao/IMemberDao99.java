package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.MemberDto;

@Mapper
public interface IMemberDao99 {

	//public int regMember(@Param("memberDto")MemberDto memberDto);
	public int regMember(MemberDto memberDto);
}
