package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.EtcDao;
import com.example.goodjob.dto.EtcDto;

@Service
public class EtcService {
	
	@Autowired
	private EtcDao etcDao;
	
	/* 이력서에 etc정보 등록 */
	public int etcWriteService(EtcDto etcDto) {
		
		return etcDao.etcWrite(etcDto);
	}
	
	/* 이력서 etc정보 상세보기 */
	public EtcDto getEtcDetailService(Long resume_no) {
		
		return etcDao.getEtcDetail(resume_no);
	}

}
