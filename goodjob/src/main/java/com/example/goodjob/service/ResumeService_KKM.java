package com.example.goodjob.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.goodjob.dao.ICareerDao_JYC;
import com.example.goodjob.dao.IEducationDao_JYC;
import com.example.goodjob.dao.IEtcDao_JYC;
import com.example.goodjob.dao.ILicenseDao_JYC;
import com.example.goodjob.dao.IMemberDao;
import com.example.goodjob.dao.IMemberDao_KKM;
import com.example.goodjob.dao.IResumeDao_JYC;
import com.example.goodjob.dao.IResumeDao_KKM;
import com.example.goodjob.dao.ISkillDao_JYC;
import com.example.goodjob.dto.CareerDto;
import com.example.goodjob.dto.EducationDto;
import com.example.goodjob.dto.EtcDto;
import com.example.goodjob.dto.LicenseDto;
import com.example.goodjob.dto.MemberDto;
import com.example.goodjob.dto.ResumeDetailCompanyDto_KKM;
import com.example.goodjob.dto.SkillDto;

@Service
public class ResumeService_KKM {

	private IResumeDao_KKM iResumeDao;
	private ICareerDao_JYC iCareerDao;
	private ILicenseDao_JYC iLicenseDao;
	private IEtcDao_JYC iEtcDao;
	private IEducationDao_JYC iEducationDao;
	private ISkillDao_JYC iSkillDao;
	private IMemberDao_KKM iMemberDao; 
	
	public ResumeService_KKM(IResumeDao_KKM iResumeDao, ICareerDao_JYC iCareerDao
			, ILicenseDao_JYC iLicenseDao, IEtcDao_JYC iEtcDao, IEducationDao_JYC iEducationDao
			, ISkillDao_JYC iSkillDao, IMemberDao_KKM iMemberDao) {
		this.iResumeDao = iResumeDao;
		this.iCareerDao = iCareerDao;
		this.iLicenseDao = iLicenseDao;
		this.iEtcDao = iEtcDao;
		this.iEducationDao = iEducationDao;
		this.iSkillDao = iSkillDao;
		this.iMemberDao = iMemberDao;
	}
	
	public ResumeDetailCompanyDto_KKM getResumeDetail(Long resume_no) {
		
		ResumeDetailCompanyDto_KKM resumeDto = iResumeDao.getResume(resume_no);
		List<CareerDto> careerList = iCareerDao.getCareer(resume_no);
		List<LicenseDto> licenseList = iLicenseDao.getLicense(resume_no);
		List<EtcDto> etcList = iEtcDao.getEtc(resume_no);
		List<EducationDto> educationList = iEducationDao.getEducation(resume_no);
		List<SkillDto> skillList = iSkillDao.findByResume_no(resume_no);
		Long mem_no = iMemberDao.getMem_no(resume_no);
		MemberDto memberDto = iMemberDao.getMemberDto(mem_no);
		
		resumeDto.setCareer(careerList);
		resumeDto.setLicense(licenseList);
		resumeDto.setEducation(educationList);
		resumeDto.setEtc(etcList);
		resumeDto.setSkill(skillList);
		resumeDto.setMember(memberDto);
		
		return resumeDto;
	}
}

