package com.example.goodjob.service;

import org.springframework.stereotype.Service;

import com.example.goodjob.dao.IServiceQuestionDao;

@Service
public class ServiceQuestionService {

	private IServiceQuestionDao iServiceQuestionDao;
	
	public ServiceQuestionService(IServiceQuestionDao iServiceQuestionDao) {
		this.iServiceQuestionDao = iServiceQuestionDao;
	}
}
