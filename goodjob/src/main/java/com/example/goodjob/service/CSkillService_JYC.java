package com.example.goodjob.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.example.goodjob.dao.ICSkillDao_JYC;

@Service
public class CSkillService_JYC {

	private ICSkillDao_JYC iCSkillDao;
	
	public CSkillService_JYC(ICSkillDao_JYC iCSkillDao) {
		this.iCSkillDao = iCSkillDao;
	}
	
	public Map<List<String>, List<Long>> getCompanySkill(){
		
		Set<String> skillNames = iCSkillDao.getSkillName();
		
		List<String> skillNameList = new ArrayList<>();
		List<Long> counts = new ArrayList<>();
		
		skillNames.forEach(skillName -> {
			Long count = iCSkillDao.getCount(skillName);
			
			skillNameList.add(skillName);
			counts.add(count);
		});
		
		Map<List<String>, List<Long>> map = new HashMap<>();
		map.put(skillNameList, counts);
		
		return map;
	}
}
