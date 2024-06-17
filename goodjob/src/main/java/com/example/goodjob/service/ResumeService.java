package com.example.goodjob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.ResumeDao;
import com.example.goodjob.dto.ResumeDto;

@Service
public class ResumeService {

	@Autowired
	private ResumeDao resumeDao;

	public ResumeDto resumeWriteService(ResumeDto resumeDto){

		resumeDao.resumeWrite(resumeDto);

		return resumeDto;
	}
	
	public List<ResumeDto> resumeGetService(Long mem_no) {
		
		List<ResumeDto> list = resumeDao.getList(mem_no);
		
		return list;
	}
	

}
