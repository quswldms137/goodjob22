package com.example.goodjob.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.goodjob.dao.ICompanyDao_JYC;
import com.example.goodjob.dao.ICompanyDetailDao_JYC;
import com.example.goodjob.dao.IMemRecruitDao_JYC;
import com.example.goodjob.dao.IMemberDao;
import com.example.goodjob.dao.IRecruitDao_JYC;
import com.example.goodjob.dao.IResumeDao_JYC;
import com.example.goodjob.dto.MemRecruitDto;
import com.example.goodjob.dto.RecruitDto;
import com.example.goodjob.dto.RecruitDto_JYC;
import com.example.goodjob.dto.ResumeDto;

@Service
public class ResumeService_JYC {

	private IResumeDao_JYC iResumeDao;
	private IMemberDao iMemberDao;
	private IMemRecruitDao_JYC iMemRecruitDao;
	private IRecruitDao_JYC iRecruitDao;
	private ICompanyDao_JYC iCompanyDao;
	private ICompanyDetailDao_JYC iCompanyDetailDao;
	
	public ResumeService_JYC(IResumeDao_JYC iResumeDao, IMemberDao iMemberDao, IMemRecruitDao_JYC iMemRecruitDao, IRecruitDao_JYC iRecruitDao
			, ICompanyDao_JYC iCompanyDao, ICompanyDetailDao_JYC iCompanyDetailDao) {
		this.iResumeDao = iResumeDao;
		this.iMemberDao = iMemberDao;
		this.iMemRecruitDao = iMemRecruitDao;
		this.iRecruitDao = iRecruitDao;
		this.iCompanyDao = iCompanyDao;
		this.iCompanyDetailDao = iCompanyDetailDao;
	}
	
	public ResumeDto getMainResume(String username) {
		
		Long mem_no = iMemberDao.getMem_no(username);
		ResumeDto resumeDto = iResumeDao.findByMem_noMain(mem_no);
		
		return resumeDto;
	}
	
	public List<MemRecruitDto> getMyMemRecruitList(String username) {
		
		Long mem_no = iMemberDao.getMem_no(username);
		List<Long> resumeNoList = iResumeDao.getResume_no(mem_no);
		
		List<MemRecruitDto> result = new ArrayList<>();
		
		resumeNoList.forEach(resume_no -> {
			List<MemRecruitDto> memRecruitDtoList = iMemRecruitDao.findByResume_no(resume_no);
			memRecruitDtoList.forEach(memRecruitDto -> {
				ResumeDto resumeDto = iResumeDao.findByResume_no(memRecruitDto.getResume_no());
				RecruitDto_JYC recruitDto = iRecruitDao.findByRecruit_no(memRecruitDto.getRecruit_no());
				String com_name = iCompanyDao.getCom_name(recruitDto.getCom_no());
				Long com_detail_no = iCompanyDetailDao.getCom_detail_no(recruitDto.getCom_no());
				memRecruitDto.setResumeDto(resumeDto);
				recruitDto.setCom_name(com_name);
				recruitDto.setCom_detail_no(com_detail_no);
				memRecruitDto.setRecruitDto(recruitDto);
				result.add(memRecruitDto);
			});
		});
		
		return result;
	}
	
	public String deleteMemRecruit(Long mem_recruit_no) {
		
		System.out.println("mem_recruti_no : " + mem_recruit_no);
		
		int result = iMemRecruitDao.deleteByMem_Recruit_no(mem_recruit_no);
		
		if(result > 0) {
			return "지원 취소 성공했습니다.";
		}
		
		return "지원 취소 실패했습니다.";
	}
}
