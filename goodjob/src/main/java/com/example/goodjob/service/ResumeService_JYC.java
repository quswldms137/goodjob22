package com.example.goodjob.service;

import org.springframework.stereotype.Service;

import com.example.goodjob.dao.IMemberDao;
import com.example.goodjob.dao.IResumeDao_JYC;
import com.example.goodjob.dto.ResumeDto;

@Service
public class ResumeService_JYC {

	private IResumeDao_JYC iResumeDao;
	private IMemberDao iMemberDao;
	
	public ResumeService_JYC(IResumeDao_JYC iResumeDao, IMemberDao iMemberDao) {
		this.iResumeDao = iResumeDao;
		this.iMemberDao = iMemberDao;
	}
	
	public ResumeDto getMainResume(String username) {
		
		Long mem_no = iMemberDao.getMem_no(username);
		ResumeDto resumeDto = iResumeDao.findByMem_no(mem_no);
		
		return resumeDto;
	}
}
