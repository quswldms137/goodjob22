package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.IUserDao99;
import com.example.goodjob.dto.UserDto;

@Service
public class UserService99 {

	@Autowired
	private IUserDao99 iUserDao99;
	
	public int regUser(UserDto userDto) {
		int result = iUserDao99.regUser(userDto);
		
		return result;
	}
	
	
	
	
}
