package com.example.goodjob.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResumeDto {
	
	private Long s_resume_no;
	private Long mem_no;
	private String title;
	private String img_url;
	private String hope_job;
	private String addr;
	private String part;
	private String military;
	private String port_url;
	private String etc;
	private String introduce;
	
}
