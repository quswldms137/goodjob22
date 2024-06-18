package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.IMemberRecruitDao;
import com.example.goodjob.dto.MemRecruitDto;

@Service
public class MemRecruitService {
	
	@Autowired
	private IMemberRecruitDao dao;

	/* 구직자 공고 상세페이지 즉시지원 */
	public MemRecruitDto nowApplyService(MemRecruitDto memRecruitDto) {
		
		dao.nowApply(memRecruitDto);
		
		return memRecruitDto;
	}
	
}
