package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.MemberDto;

@Mapper
public interface IMemberDao {

	public MemberDto findByUsername(@Param("username") String username);
	public Long getMem_no(@Param("username") String username);
	public void update(@Param("memberDto") MemberDto memberDto);
	public void deleteInformation(@Param("mem_no") Long mem_no);
<<<<<<< HEAD
	
	public String findByMem_no(@Param("mem_no") Long mem_no);
=======
	public List<MemberDto> getMemberDtoList(@Param("start") int start);
	public int count();
	public MemberDto findByMem_no(@Param("mem_no") Long mem_no);
>>>>>>> 526da82355ada9429f294493e912e56c48975b5f
}
