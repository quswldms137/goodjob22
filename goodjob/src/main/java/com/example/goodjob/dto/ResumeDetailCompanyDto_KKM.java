package com.example.goodjob.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ResumeDetailCompanyDto_KKM {

	private Long resume_no;
	private Long mem_no;
	private String title;
	private String img_url;
	private String hope_job;
	private String hope_city;
	private String hope_pay;
	private String military;
	private String port_url;
	private String growth;
	private String motive;
	private String personality;
	public int main;
	
	private String mem_name;

	private List<CareerDto> career;
	private List<LicenseDto> license;
	private List<EtcDto> etc;
	private List<EducationDto> education;
	private List<SkillDto> skill;
	private MemberDto member;
}
