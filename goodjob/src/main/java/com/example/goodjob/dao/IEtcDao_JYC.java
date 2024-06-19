package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.EtcDto;

@Mapper
public interface IEtcDao_JYC {

	public int deleteByResume_no(@Param("resume_no") Long resume_no);
	public List<EtcDto> getEtc(@Param("resume_no") Long resume_no);
}
