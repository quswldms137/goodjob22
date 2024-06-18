package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.ResumeDto;

@Mapper
public interface IResumeDao_JYC {

	public ResumeDto findByMem_no(@Param("mem_no") Long mem_no);
	public List<Long> getResume_no(@Param("mem_no") Long mem_no);
	public int deleteByResume_no(@Param("resume_no") Long resume_no);
}
