package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.LicenseDto;

@Mapper
public interface LicenseDao {
	
	public int licenseWrite(LicenseDto licenseDto);
	
	/* 이력서 디테일에 들어가는 자격증 정보 */
	public LicenseDto getLicenseDetail(@Param("resume_no") Long resume_no);
	

}
