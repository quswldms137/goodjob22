package com.example.goodjob.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LicenseDto {

	private Long license_no;
	private Long s_resume_no;
	private String licence_name;
	private String agency;
	private LocalDate get_date;
	
}
