package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.UserDto;

@Mapper
public interface IUserDao99 {

	public int regUser(UserDto userDto);
}
