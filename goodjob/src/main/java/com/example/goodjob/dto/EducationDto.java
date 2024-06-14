package com.example.goodjob.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EducationDto {
	
	private Long education_no;
	private Long resume_no;
	private String school;
	private LocalDate edu_join_date;
	private LocalDate edu_gra_date;
	private boolean graduation;
	private String grades;
	private String major;
	
}
