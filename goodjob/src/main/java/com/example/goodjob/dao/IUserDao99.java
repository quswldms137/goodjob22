package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.MemberDto;
import com.example.goodjob.dto.UserDto;

@Mapper
public interface IUserDao99 {
	//회원가입
	public int regUser(UserDto userDto);
	//로그인
	public int userLogin(UserDto userDto);
	//로그인한 회원 role
	public String getRole(UserDto userDto);
	//개인회원 아이디 찾기
	public String getMemUername(@Param("mem_name") String mem_name, @Param("mem_tel") String mem_tel);
	//개인회원 정보 확인
	public int memCheck(MemberDto memberDto);
	//개인회원 비밀번호 찾기
	public String getMemPassword(@Param("username") String username);
	//기업 아이디 찾기
	public String getComUsername(@Param("com_name") String com_name, @Param("com_companynum") String com_companynum);
	
}
