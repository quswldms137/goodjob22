package com.example.goodjob.service;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.IQnaDao99;
import com.example.goodjob.dto.ServiceQuestionDto;

@Service
public class QnaService99 {

	@Autowired
	private IQnaDao99 iQnaDao99;
	
	public int regQuestion(ServiceQuestionDto serviceQuestionDto) {
		LocalDate today= LocalDate.now();
		
		
		serviceQuestionDto.setMem_no(null);
		serviceQuestionDto.setReg_date(today);
		
		int result = iQnaDao99.regQuestion(serviceQuestionDto);
		
		return result;
	}
}
