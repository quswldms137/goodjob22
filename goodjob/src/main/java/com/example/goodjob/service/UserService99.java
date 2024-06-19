package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.INewPasswordDao;
import com.example.goodjob.dao.IUserDao99;
import com.example.goodjob.dto.CompanyDto;
import com.example.goodjob.dto.MemberDto;
import com.example.goodjob.dto.UserDto;

@Service
public class UserService99 {

	private IUserDao99 iUserDao;
	private INewPasswordDao iNewPasswordDao;
	
	public UserService99(IUserDao99 iUserDao, INewPasswordDao iNewPasswordDao) {
		this.iUserDao = iUserDao;
		this.iNewPasswordDao = iNewPasswordDao;
	}
	
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
	//개인회원 아이디 갯수
	public int getMemUsernameCount(String mem_name, String mem_tel) {
		int accountCount = iUserDao.getMemUsernameCount(mem_name, mem_tel);
		return accountCount;
	}
	//개인회원 암호화된 비밀번호 찾기
	public String getPassword(String username) {
		String password = iUserDao.getPassword(username);
		return password;
	}
	//로그인시 복호화 과정
	public String getMemPassword(String username) {
		String password = iUserDao.getMemPassword(username);
		return password;
	}
	//기업회원 아이디 찾기
	public String getComUsername(String com_name, String com_companynum) {
		String username = iUserDao.getComUsername(com_name, com_companynum);
		return username;
	}
	//아이디 중복체크
	public int checkUsername(String username) {
		int result = iUserDao.checkUsername(username);
		System.out.println("serviceResult: " + result);
		return result;
	}
	//개인회원 정보체크
	public int memCheck(MemberDto memberDto) {
		int result = iUserDao.memCheck(memberDto);
		return result;
	}
	//기업회원 정보체크
	public int comCheck(CompanyDto companyDto) {
		int result = iUserDao.comCheck(companyDto);
		return result;
	}
	//비밀번호 재설정
	public void modifyPassword(UserDto userDto) {
		iUserDao.modifyPassword(userDto);
	}
	
	// ///////////////////////////////////////////////////
	public String getMemPassword2(String username) {
		
		String password = iNewPasswordDao.getMemPassword(username);
		return password;
	}
	
	
}
