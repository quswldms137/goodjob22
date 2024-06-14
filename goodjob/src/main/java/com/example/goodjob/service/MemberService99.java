package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.IMemberDao99;
import com.example.goodjob.dto.MemberDto;

@Service
public class MemberService99 {

	@Autowired
	private IMemberDao99 iMemberDao;
	
	public int regMember(MemberDto memberDto) {
		
		int result = iMemberDao.regMember(memberDto);
		
		return result;
	}
}
