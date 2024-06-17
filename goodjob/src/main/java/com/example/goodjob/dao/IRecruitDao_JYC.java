package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.RecruitDto_JYC;

@Mapper
public interface IRecruitDao_JYC {

	public RecruitDto_JYC findByRecruit_no(@Param("recruit_no") Long recruit_no);
	public List<RecruitDto_JYC> getVip();
	public RecruitDto_JYC findVipByCom_no(@Param("com_no") Long com_no);
	public List<RecruitDto_JYC> findAllOrderByReg_dateDesc();
}
