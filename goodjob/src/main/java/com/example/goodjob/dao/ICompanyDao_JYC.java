package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.CompanyDto_JYC;

@Mapper
public interface ICompanyDao_JYC {

	public CompanyDto_JYC findByCom_no(@Param("com_no") Long com_no);
	public String getCom_name(@Param("com_no") Long com_no);
	public List<Long> getCom_noOrderByVip();
}
