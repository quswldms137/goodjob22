package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.MemberDto;

@Mapper
public interface IMemberDao {

	public MemberDto findByUsername(@Param("username") String username);
	public Long getMem_no(@Param("username") String username);
	public void update(@Param("memberDto") MemberDto memberDto);
	public void deleteInformation(@Param("mem_no") Long mem_no);
}
