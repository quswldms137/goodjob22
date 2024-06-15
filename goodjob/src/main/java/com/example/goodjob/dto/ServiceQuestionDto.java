package com.example.goodjob.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ServiceQuestionDto {

	private Long cs_no;
	private Long mem_no;
	private String title;
	private String content;
	private LocalDate reg_date;
	private String category;
	private int ch_private;
	private String answer;
}
