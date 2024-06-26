package com.example.goodjob.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResumeAndSkillDto {
	
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
	private String mem_name;
	private List<String> sk_name;
	private Long com_no;
}
