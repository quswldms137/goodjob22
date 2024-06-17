package com.example.goodjob.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResumeDetailDto {
	
	private ResumeDto resume;
	private CareerDto career;
	private LicenseDto license;
	private EtcDto etc;
	private EducationDto education;
	private SkillDto skill;
	private MemberDto member;

}
