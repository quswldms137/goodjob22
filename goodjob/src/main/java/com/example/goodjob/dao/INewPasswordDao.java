package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.UserDto;

@Mapper
public interface INewPasswordDao {
	//개인회원 비밀번호 찾기
	public String getMemPassword(@Param("username") String username);
	//비밀번호 재설정
	public void modifyPassword(UserDto userDto);
}
