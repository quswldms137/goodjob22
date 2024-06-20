package com.example.goodjob.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.goodjob.dao.ICareerDao_JYC;
import com.example.goodjob.dao.IComInterestDao_JYC;
import com.example.goodjob.dao.IEducationDao_JYC;
import com.example.goodjob.dao.IEtcDao_JYC;
import com.example.goodjob.dao.ILicenseDao_JYC;
import com.example.goodjob.dao.IMemCommunityDao_JYC;
import com.example.goodjob.dao.IMemInterestDao;
import com.example.goodjob.dao.IMemRecruitDao_JYC;
import com.example.goodjob.dao.IMemReplyDao_JYC;
import com.example.goodjob.dao.IMemberDao;
import com.example.goodjob.dao.INoticeDao_JYC;
import com.example.goodjob.dao.IResumeDao_JYC;
import com.example.goodjob.dao.IScrapRecruitDao;
import com.example.goodjob.dao.IServiceQuestionDao;
import com.example.goodjob.dao.IServiceRequestDao_JYC;
import com.example.goodjob.dao.ISkillDao_JYC;
import com.example.goodjob.dao.IUserDao;
import com.example.goodjob.dto.MemberDto;
import com.example.goodjob.dto.UserDto;

@Service
public class MemberService {

	private IMemberDao iMemberDao;
	private IUserDao iUserDao;
	private IResumeDao_JYC iResumeDao;
	private ICareerDao_JYC iCareerDao;
	private IEducationDao_JYC iEducationDao;
	private IEtcDao_JYC iEtcDao;
	private ILicenseDao_JYC iLicenseDao;
	private ISkillDao_JYC iSkillDao;
	private IComInterestDao_JYC iComInterestDao;
	private IMemCommunityDao_JYC iMemCommunityDao;
	private IMemInterestDao iMemInterestDao;
	private IMemRecruitDao_JYC iMemRecruitDao;
	private IMemReplyDao_JYC iMemReplyDao;
	private INoticeDao_JYC iNoticeDao;
	private IScrapRecruitDao iScrapRecruitDao;
	private IServiceQuestionDao iServiceQuestionDao;
	private IServiceRequestDao_JYC iServiceRequestDao;
	
	public MemberService(IMemberDao iMemberDao, IUserDao iUserDao, IResumeDao_JYC iResumeDao, ICareerDao_JYC iCareerDao
			, IEducationDao_JYC iEducationDao, IEtcDao_JYC iEtcDao, ILicenseDao_JYC iLicenseDao, ISkillDao_JYC iSkillDao
			, IComInterestDao_JYC iComInterestDao, IMemCommunityDao_JYC iMemCommunityDao, IMemInterestDao iMemInterestDao
			, IMemRecruitDao_JYC iMemRecruitDao, IMemReplyDao_JYC iMemReplyDao, INoticeDao_JYC iNoticeDao, IScrapRecruitDao iScrapRecruitDao
			, IServiceQuestionDao iServiceQuestionDao, IServiceRequestDao_JYC iServiceRequestDao) {
		this.iMemberDao = iMemberDao;
		this.iUserDao = iUserDao;
		this.iResumeDao = iResumeDao;
		this.iCareerDao = iCareerDao;
		this.iEducationDao = iEducationDao;
		this.iEtcDao = iEtcDao;
		this.iLicenseDao = iLicenseDao;
		this.iSkillDao = iSkillDao;
		this.iComInterestDao = iComInterestDao;
		this.iMemCommunityDao = iMemCommunityDao;
		this.iMemInterestDao = iMemInterestDao;
		this.iMemRecruitDao = iMemRecruitDao;
		this.iMemReplyDao = iMemReplyDao;
		this.iNoticeDao = iNoticeDao;
		this.iScrapRecruitDao = iScrapRecruitDao;
		this.iServiceQuestionDao = iServiceQuestionDao;
		this.iServiceRequestDao = iServiceRequestDao;
	}
	
	
	public MemberDto getInformation(String username) {
		
		return iMemberDao.findByUsername(username);
	}
	
	public MemberDto saveInformation(MemberDto memberDto) {
		
		iMemberDao.update(memberDto);
		iUserDao.update(memberDto);
		
		MemberDto dto = iMemberDao.findByUsername(memberDto.getUsername());
		UserDto userDto = iUserDao.findByUsername(memberDto.getUsername());
		dto.setPassword(userDto.getPassword());
		
		return dto;
	}
	
	public String deleteInformation(Long mem_no, String username) {
		
		List<Long> resume_noList = iResumeDao.getResume_no(mem_no);
		
		resume_noList.forEach(resume_no -> {
			iCareerDao.deleteByResume_no(resume_no);
			iEducationDao.deleteByResume_no(resume_no);
			iEtcDao.deleteByResume_no(resume_no);
			iLicenseDao.deleteByResume_no(resume_no);
			iSkillDao.deleteByResume_no(resume_no);
			iResumeDao.deleteByResume_no(resume_no);
			iMemRecruitDao.deleteByResume_no(resume_no);
		});
		
		List<Long> cs_noList = iServiceQuestionDao.getCs_no(mem_no);
		cs_noList.forEach(cs_no -> {
			iServiceRequestDao.deleteByCs_no(cs_no);
		});
		
		iComInterestDao.deleteByMem_no(mem_no);
		iMemCommunityDao.deleteByMem_no(mem_no);
		iMemInterestDao.deleteByMem_no(mem_no);
		iMemReplyDao.deleteByMem_no(mem_no);
		iNoticeDao.deleteByMem_no(mem_no);
		iScrapRecruitDao.deleteByMem_no(mem_no);
		iServiceQuestionDao.deleteByMem_no(mem_no);
		
		iMemberDao.deleteInformation(mem_no);
		int result = iUserDao.deleteUser(username);
		
		if(result == 1) {
			return "회원탈퇴 성공";
		}else {
			return "회원탈퇴 실패";
		}
	}
	
	public Long getMem_no(String username) {
		
		return iMemberDao.getMem_no(username);
	}
	
	public List<MemberDto> getMemberList(int page) {
		
		List<MemberDto> memberList =  iMemberDao.getMemberDtoList((page - 1) * 5);
		
		
		int count = iMemberDao.count();
		memberList.get(0).setTotal(count);
		
		return memberList;
	}
	
	public MemberDto getMemberDto(Long mem_no) {
		
		MemberDto memberDto = iMemberDao.findByMem_no(mem_no);
		UserDto userDto = iUserDao.findByUsername(memberDto.getUsername());
		
		memberDto.setPassword(userDto.getPassword());
		memberDto.setRole(userDto.getRole());
		
		return memberDto;
	}
	
}
