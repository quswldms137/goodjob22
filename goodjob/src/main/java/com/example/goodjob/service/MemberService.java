package com.example.goodjob.service;

import org.springframework.stereotype.Service;

import com.example.goodjob.dao.IMemberDao;
import com.example.goodjob.dao.IUserDao;
import com.example.goodjob.dto.MemberDto;
import com.example.goodjob.dto.UserDto;

@Service
public class MemberService {

	private IMemberDao iMemberDao;
	
	private IUserDao iUserDao;
	
	public MemberService(IMemberDao iMemberDao, IUserDao iUserDao) {
		this.iMemberDao = iMemberDao;
		this.iUserDao = iUserDao;
	}
	
	public MemberDto getInformation(String username) {
		
		return iMemberDao.findByUsername(username);
	}
	
	public MemberDto saveInformation(MemberDto memberDto) {
		
		iMemberDao.update(memberDto);
		
		return iMemberDao.findByUsername(memberDto.getUsername());
	}
	
	public String deleteInformation(Long mem_no, String username) {
		
		iMemberDao.deleteInformation(mem_no);
		int result = iUserDao.deleteUser(username);
		
		if(result == 1) {
			return "회원탈퇴 성공";
		}else {
			return "회원탈퇴 실패";
		}
		
	}
}
