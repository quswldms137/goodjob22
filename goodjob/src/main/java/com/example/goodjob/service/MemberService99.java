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
		MemberDto member = new MemberDto();
		member.setUsername(memberDto.getUsername());
		member.setMem_name(memberDto.getMem_name());
		member.setMem_tel(memberDto.getMem_tel());
		member.setMem_email(memberDto.getMem_email());
		member.setMem_gender(memberDto.getMem_gender());
		member.setMem_birth(memberDto.getMem_birth());
		member.setMem_addr(memberDto.getMem_addr());
		int result = iMemberDao.regMember(memberDto);
		
		return result;
	}
}
