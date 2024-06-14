package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.MemInterestDto;
import com.example.goodjob.dto.ScrapRecruitDto;

@Mapper
public interface IMemInterestDao {

	public int createSubscribe(@Param("memInterestDto") MemInterestDto memInterestDto);
	public List<Long> getCom_no(@Param("mem_no") Long mem_no);
	public int getSubscribe(@Param("memInterestDto") MemInterestDto memInterestDto);
	public int removeSubscribe(@Param("memInterestDto") MemInterestDto memInterestDto);
}
