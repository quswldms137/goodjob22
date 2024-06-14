package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.CareerDao;
import com.example.goodjob.dto.CareerDto;

@Service
public class CareerService {
	
	@Autowired
	private CareerDao careerDao;
	
	public CareerDto careerWriteService(CareerDto careerDto) {
		
		CareerDto result = careerDao.careerWrite(careerDto);
		
		return result;
	}

}
