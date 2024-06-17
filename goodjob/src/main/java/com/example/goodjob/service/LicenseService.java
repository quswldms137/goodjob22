package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.LicenseDao;
import com.example.goodjob.dto.LicenseDto;

@Service
public class LicenseService {
	
	@Autowired
	private LicenseDao licenseDao;
	
	public LicenseDto licenseWriteService(LicenseDto licenseDto) {
		
		LicenseDto result = licenseDao.licenseWrite(licenseDto);
		
		return result;
		
	}

}