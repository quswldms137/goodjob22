package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.EtcDao;
import com.example.goodjob.dto.EtcDto;

@Service
public class EtcService {
	
	@Autowired
	private EtcDao etcDao;
	
	public int etcWriteService(EtcDto etcDto) {
		
		return etcDao.etcWrite(etcDto);
	}

}
