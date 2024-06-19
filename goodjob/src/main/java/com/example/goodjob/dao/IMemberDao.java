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
	// mem_no 로 member 테이블을 조회해서 mem_name 을 얻는 메서드
	public String findMem_nameWithMem_no(@Param("mem_no") Long mem_no);
	
	public List<MemberDto> getMemberDtoList(@Param("start") int start);
	public int count();
	public MemberDto findByMem_no(@Param("mem_no") Long mem_no);

}
