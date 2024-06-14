package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.RecruitDto_JYC;

@Mapper
public interface IRecruitDao_JYC {

	public RecruitDto_JYC findByRecruit_no(@Param("recruit_no") Long recruit_no);
}
