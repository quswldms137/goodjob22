package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.IScrapRecruitDao93;
import com.example.goodjob.dto.ScrapRecruitDto;

@Service
public class ScrapRecruitService93 {
	
	@Autowired
	private IScrapRecruitDao93 dao;

	/* 공고 상세페이지 스크랩하기 */
	public ScrapRecruitDto scrapRecruitRegService(ScrapRecruitDto scrapRecruitDto) {
		
		dao.scrapRecruitReg(scrapRecruitDto);
		
		return scrapRecruitDto;
		
	}
	
}
