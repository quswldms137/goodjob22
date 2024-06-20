package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.goodjob.dto.ScrapRecruitDto;

@Mapper
public interface IScrapRecruitDao93 {
	
	public int scrapRecruitReg(ScrapRecruitDto scrapRecruitDto);

}
