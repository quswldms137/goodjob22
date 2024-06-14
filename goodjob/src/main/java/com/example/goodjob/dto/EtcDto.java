package com.example.goodjob.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EtcDto {
	
	private Long etc_no;
	private Long resume_no;
	private MultipartFile etc_name;
	private String etc_origin_name;

}
