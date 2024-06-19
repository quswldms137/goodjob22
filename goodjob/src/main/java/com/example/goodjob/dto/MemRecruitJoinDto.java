package com.example.goodjob.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemRecruitJoinDto {

	private Long com_no;
	private String rectitle;
	private String title;
	private String mem_name;
	private String hope_job;
	private String hope_city;
	private Long resume_no;
	
}
