package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.UserDto;

@Mapper
public interface IUserDao99 {
	//회원가입
	public int regUser(UserDto userDto);
	//로그인
	public int userLogin(UserDto userDto);
	//로그인한 회원 role
	public String getRole(UserDto userDto);
}
