package com.example.goodjob.service;

import org.springframework.stereotype.Service;

import com.example.goodjob.dao.IUserDao;
import com.example.goodjob.dto.UserDto;

@Service
public class UserService {
	
	private IUserDao iUserDao;
	
	public UserService(IUserDao iUserDao) {
		this.iUserDao = iUserDao;
	}
	
	public UserDto getInfo(String username) {
		return iUserDao.findByUsername(username);
	}
	
	public String checkId(String username) {
		
		int result = iUserDao.checkId(username); 
		
		if(result == 0) {
			return "사용 가능한 아이디입니다.";
		}
		
		return "이미 존재하는 아이디입니다.";
	}
}
