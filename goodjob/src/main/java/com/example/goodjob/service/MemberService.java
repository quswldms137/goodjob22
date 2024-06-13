package com.example.goodjob.service;

import org.springframework.stereotype.Service;

import com.example.goodjob.dao.IMemberDao;
import com.example.goodjob.dto.MemberDto;

@Service
public class MemberService {

	private IMemberDao iMemberDao;
	
	public MemberService(IMemberDao iMemberDao) {
		this.iMemberDao = iMemberDao;
	}
	
	public MemberDto getInformation(String username) {
		
		return iMemberDao.findByUsername(username);
	}
	
	public String saveInformation(MemberDto memberDto) {
		
		iMemberDao.update(memberDto);
		
		return "";
	}
	
}
