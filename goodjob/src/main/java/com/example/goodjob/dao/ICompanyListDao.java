package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.goodjob.dto.CompanyDetailDto94;

@Mapper
public interface ICompanyListDao {
	public List<CompanyDetailDto94> getCompanyList();
}