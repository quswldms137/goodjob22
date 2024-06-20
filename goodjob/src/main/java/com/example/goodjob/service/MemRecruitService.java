package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.IMemberRecruitDao;
import com.example.goodjob.dao.IResumeDao_JHY;
import com.example.goodjob.dto.ResumeAndSkillDto;

@Service
public class MemRecruitService {
	
	@Autowired
	private IMemberRecruitDao dao;
	
	@Autowired
	private IResumeDao_JHY resumeDao;

	/* 구직자 공고 상세페이지 즉시지원 */
	public int nowApplyService(Long recruit_no, Long mem_no) {
		
		ResumeAndSkillDto result = resumeDao.findByMem_no(mem_no);
		
		int result2 = dao.nowApply(result.getResume_no(), recruit_no);
		
		if(result2 > 0) {
			return result2;
		}
		
		return 0;
	}
	
}
