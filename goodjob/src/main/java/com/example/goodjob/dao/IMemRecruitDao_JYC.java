package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.MemRecruitDto;

@Mapper
public interface IMemRecruitDao_JYC {

	public List<MemRecruitDto> findByResume_no(@Param("resume_no") Long resume_no);
	public int deleteByResume_no(@Param("mem_no") Long mem_no);
	public int deleteByRecruit_no(@Param("recruit_no") Long recruit_no);
}
