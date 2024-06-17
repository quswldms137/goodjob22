package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.IMemberDao93;
import com.example.goodjob.dto.MemberDto;

@Service
public class MemberService93 {

	@Autowired
	private IMemberDao93 memberDao;
	
	/* 이력서 멤버정보 상세보기 */
	public MemberDto getMemberDetailService(Long mem_no) {
		
		return memberDao.getMemberDetail(mem_no);
	}
}
