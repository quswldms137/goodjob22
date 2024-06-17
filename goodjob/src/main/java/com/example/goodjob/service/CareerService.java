package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.CareerDao;
import com.example.goodjob.dto.CareerDto;

@Service
public class CareerService {
	
	@Autowired
	private CareerDao careerDao;
	
	/* 이력서에 경력사항 등록 */
	public int careerWriteService(CareerDto careerDto) {
		
		return careerDao.careerWrite(careerDto);
	}
	
	/* 이력서 경력사항 상세보기 */
	public CareerDto getCareerDetailService(Long resume_no) {
		
		return careerDao.getCareerDetail(resume_no);
	}
	

}
