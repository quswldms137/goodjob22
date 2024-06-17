package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.EducationDao;
import com.example.goodjob.dto.EducationDto;

@Service
public class EducationService {
	
	@Autowired
	private EducationDao educationDao;
	
	public int educationWriteService(EducationDto educationDto) {
		
		return educationDao.educationWrite(educationDto);
		
	}

}
