package com.example.goodjob.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.example.goodjob.dao.ICSkillDao_JYC;
import com.example.goodjob.dao.ICompanyDao_JYC;
import com.example.goodjob.dao.IMemberDao;
import com.example.goodjob.dao.IRecruitDao_JYC;
import com.example.goodjob.dao.IResumeDao_JYC;
import com.example.goodjob.dao.ISkillDao_JYC;
import com.example.goodjob.dto.CSkillDto;
import com.example.goodjob.dto.RecruitDto_JYC;
import com.example.goodjob.dto.SkillDto;

@Service
public class SkillService_JYC {

	private IMemberDao iMemberDao;
	private IResumeDao_JYC iResumeDao;
	private ISkillDao_JYC iSkillDao;
	private ICSkillDao_JYC iCSkillDao;
	private IRecruitDao_JYC iRecruitDao;
	private ICompanyDao_JYC iCompanyDao;

	public SkillService_JYC(IMemberDao iMemberDao, IResumeDao_JYC iResumeDao, ISkillDao_JYC iSkillDao, ICSkillDao_JYC iCSkillDao, 
			IRecruitDao_JYC iRecruitDao, ICompanyDao_JYC iCompanyDao) {
		this.iMemberDao = iMemberDao;
		this.iResumeDao = iResumeDao;
		this.iSkillDao = iSkillDao;
		this.iCSkillDao = iCSkillDao;
		this.iRecruitDao = iRecruitDao;
		this.iCompanyDao = iCompanyDao;
	}

	public List<RecruitDto_JYC> getSkillMatching(String username) {

		Long mem_no = iMemberDao.getMem_no(username);

		List<Long> resume_noList = iResumeDao.getResume_no(mem_no);

		Set<String> mySkillName = new HashSet<>();

		resume_noList.forEach(resume_no -> {

			List<SkillDto> skillList = iSkillDao.findByResume_no(resume_no);

			skillList.forEach(skill -> {
				mySkillName.add(iSkillDao.getSkillName(skill.getSkill_no()));
			});

		});
		
		List<CSkillDto> cSkillDtos = iCSkillDao.findAll();

		
		Set<Long> recruit_noList = new HashSet<>();
		
		if (cSkillDtos != null) {

			cSkillDtos.forEach(cskill -> {

				mySkillName.forEach(skillName -> {
					if (skillName.equals(cskill.getSkill_name())) {
						recruit_noList.add(cskill.getRecruit_no());
					}
				});

			});
		}
		
		List<RecruitDto_JYC> recruitDtoList = new ArrayList<>();

		recruit_noList.forEach(recruit_no -> {
			recruitDtoList.add(iRecruitDao.findByRecruit_no(recruit_no));
		});
		
		recruitDtoList.forEach(recruitDto ->{
			recruitDto.setCom_name(iCompanyDao.getCom_name(recruitDto.getCom_no()));
			
		});
		
		return recruitDtoList;
	}
}
