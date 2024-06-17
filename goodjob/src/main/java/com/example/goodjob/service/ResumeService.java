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

	/* 이력서 등록 */
	public ResumeDto resumeWriteService(ResumeDto resumeDto){

		resumeDao.resumeWrite(resumeDto);

		return resumeDto;
	}
	
	/* 로그인된 멤버 이력서 리스트 */
	public List<ResumeDto> resumeGetService(Long mem_no) {
		
		List<ResumeDto> list = resumeDao.getList(mem_no);
		
		return list;
	}
	
	/* 이력서 상세보기 */
	public ResumeDto getResumeDetailService(Long resume_no) {
		
		return resumeDao.getResumeDetail(resume_no);
		
	}
	

}
