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
	private IUserDao99 iUserDao;
	//기업회원가입
	public int regUser(CompanyDto companyDto) {
		UserDto user = new UserDto();
		user.setUsername(companyDto.getUsername());
		user.setPassword(companyDto.getPassword());
		user.setRole(companyDto.getRole());
		int result = iUserDao.regUser(user);
		
		return result;
	}
	//개인, 관리자 회원가입
	public int regUser(MemberDto memberDto) {
		UserDto user = new UserDto();
		user.setUsername(memberDto.getUsername());
		user.setPassword(memberDto.getPassword());
		user.setRole(memberDto.getRole());
		int result = iUserDao.regUser(user);
		
		return result;
	}
	
	//로그인
	public int userLogin(UserDto userDto) {
		
		int result = iUserDao.userLogin(userDto);
		return result;
	}
	
	//로그인한 회원 role
	public String getRole(UserDto userDto) {
		String role = iUserDao.getRole(userDto);
		return role;
	}
	
	//개인회원 아이디 찾기
	public String getMemUsername(String mem_name, String mem_tel) {
		String username = iUserDao.getMemUername(mem_name, mem_tel);
		
		return username;
	}
	
	//개인회원 암호화된 비밀번호 찾기
	public String getPassword(String username) {
		String password = iUserDao.getPassword(username);
		return password;
	}
	
	//개인회원 정보체크
	public int memCheck(MemberDto memberDto) {
		int result = iUserDao.memCheck(memberDto);
		return result;
	}
	
	public String getMemPassword(String username) {
		String password = iUserDao.getMemPassword(username);
		return password;
	}
	
	//기업회원 아이디 찾기
	public String getComUsername(String com_name, String com_companynum) {
		String username = iUserDao.getComUsername(com_name, com_companynum);
		return username;
	}
	
	//
	
	
	
	
}
