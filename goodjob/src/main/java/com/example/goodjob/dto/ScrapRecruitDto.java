package com.example.goodjob.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ScrapRecruitDto {
	
	private Long mem_community_no;
	private Long mem_no;
	private String title;
	private String content;
	private LocalDate reg_date;
	private Long views;
	private String theme;
	
}
