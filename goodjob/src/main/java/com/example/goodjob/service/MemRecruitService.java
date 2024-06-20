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
	
	@Autowired
	private IMemberRecruitDao memberRecruitDao;

	/* 구직자 공고 상세페이지 즉시지원 */
	public int nowApplyService(Long recruit_no, Long mem_no) {
		
		ResumeAndSkillDto result = resumeDao.findByMem_no(mem_no);
		
		int result2 = dao.nowApply(result.getResume_no(), recruit_no);
		
		if(result2 > 0) {
			return result2;
		}
		
		return 0;
	}
	
	/* 공고 상세페이지에서 즉시지원하면 버튼 비활성화 할라고 */
	public int applyChkService(Long resume_no, Long recruit_no) {
	
		int result = memberRecruitDao.applyChk(resume_no, recruit_no);
		
		return result;
		
	}
	
}
