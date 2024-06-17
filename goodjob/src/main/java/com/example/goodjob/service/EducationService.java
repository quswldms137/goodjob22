package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.EducationDao;
import com.example.goodjob.dto.EducationDto;

@Service
public class EducationService {
	
	@Autowired
	private EducationDao educationDao;
	
	/* 이력서에 학력정보 등록 */
	public int educationWriteService(EducationDto educationDto) {
		
		return educationDao.educationWrite(educationDto);
		
	}
	
	/* 이력서 학력정보 상세보기 */
	public EducationDto getEducationDetailService(Long resume_no) {
		
		return educationDao.getEducationDetail(resume_no);
	}
	
	

}
