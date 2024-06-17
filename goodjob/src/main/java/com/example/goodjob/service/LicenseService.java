package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.LicenseDao;
import com.example.goodjob.dto.LicenseDto;

@Service
public class LicenseService {
	
	@Autowired
	private LicenseDao licenseDao;
	
	/* 이력서에 자격증정보 등록 */
	public int licenseWriteService(LicenseDto licenseDto) {
		
		return licenseDao.licenseWrite(licenseDto);
		
	}
	
	/* 이력서 자격증 상세보기 */
	public LicenseDto getLicenseDetailService(Long resume_no) {
		
		return licenseDao.getLicenseDetail(resume_no);
	}

}
