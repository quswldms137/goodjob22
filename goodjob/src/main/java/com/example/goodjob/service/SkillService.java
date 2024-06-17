package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.SkillDao;
import com.example.goodjob.dto.SkillDto;

@Service
public class SkillService {
	
	@Autowired
	private SkillDao skillDao;
	
	/* 이력서에 보유스킬정보 등록 */
	public int skillWriteService(SkillDto skillDto) {
		
		return skillDao.skillWrite(skillDto);
		
	}
	
	/* 이력서 보유스킬 상세보기 */
	public SkillDto getSkillDetailService(Long resume_no) {
		
		return skillDao.getSkillDetail(resume_no);
	}

}
