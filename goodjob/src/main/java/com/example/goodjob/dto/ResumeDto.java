package com.example.goodjob.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResumeDto {
	
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
	
}
