package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.ScrapRecruitDto;

@Mapper
public interface IScrapRecruitDao {

	public int createScrap(@Param("scrapRecruitDto") ScrapRecruitDto scrapRecruitDto);
	public List<Long> getRecruit_no(@Param("mem_no") Long mem_no, @Param("start") int start);
	public int getScrap(@Param("scrapRecruitDto") ScrapRecruitDto scrapRecruitDto);
	public int removeScrap(@Param("scrapRecruitDto") ScrapRecruitDto scrapRecruitDto);
	public List<Long> findByMem_no(@Param("mem_no") Long mem_no);
}
