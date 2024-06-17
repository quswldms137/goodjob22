package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.goodjob.dto.LicenseDto;

@Mapper
public interface LicenseDao {
	
	public int licenseWrite(LicenseDto licenseDto);
	

}
