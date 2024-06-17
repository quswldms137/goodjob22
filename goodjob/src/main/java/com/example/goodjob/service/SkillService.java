package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.SkillDao;
import com.example.goodjob.dto.SkillDto;

@Service
public class SkillService {
	
	@Autowired
	private SkillDao skillDao;
	
	public int skillWriteService(SkillDto skillDto) {
		
		return skillDao.skillWrite(skillDto);
		
	}

}
