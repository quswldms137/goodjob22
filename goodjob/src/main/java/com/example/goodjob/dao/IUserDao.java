package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.MemberDto;
import com.example.goodjob.dto.UserDto;

@Mapper
public interface IUserDao {

	public UserDto findByUsername(@Param("username") String username);
	public int deleteUser(@Param("username") String username);
}
