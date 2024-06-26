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
	private String username;
	private Long mem_no;
	private Long com_no;
	private String title;
	private String content;
	private LocalDate reg_date;
	private String category;
	private String answer;

	private int total;
	private int yesAnswerTotal;
	private int noAnswerTotal;
}
