package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.EducationDao;
import com.example.goodjob.dto.EducationDto;

@Service
public class EducationService {
	
	@Autowired
	private EducationDao educationDao;
	
	public EducationDto educationWriteService(EducationDto educationDto) {
		
		EducationDto result = educationDao.educationWrite(educationDto);
		
		return result;
		
	}

}
