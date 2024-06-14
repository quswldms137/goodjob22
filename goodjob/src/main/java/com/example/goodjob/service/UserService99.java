package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.IUserDao99;
import com.example.goodjob.dto.CompanyDto;
import com.example.goodjob.dto.MemberDto;
import com.example.goodjob.dto.UserDto;

@Service
public class UserService99 {

	@Autowired
	private IUserDao99 iUserDao99;
	//기업회원가입
	public int regUser(CompanyDto companyDto) {
		UserDto user = new UserDto();
		user.setUsername(companyDto.getUsername());
		user.setPassword(companyDto.getPassword());
		user.setRole(companyDto.getRole());
		int result = iUserDao99.regUser(user);
		
		return result;
	}
	//개인, 관리자 회원가입
	public int regUser(MemberDto memberDto) {
		UserDto user = new UserDto();
		user.setUsername(memberDto.getUsername());
		user.setPassword(memberDto.getPassword());
		user.setRole(memberDto.getRole());
		int result = iUserDao99.regUser(user);
		
		return result;
	}
	
	//로그인
	public int userLogin(UserDto userDto) {
		
		int result = iUserDao99.userLogin(userDto);
		return result;
	}
	
	//로그인한 회원 role
	public String getRole(UserDto userDto) {
		String role = iUserDao99.getRole(userDto);
		return role;
	}
	
	
	
	
}
