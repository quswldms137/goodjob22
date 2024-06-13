package com.example.goodjob.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ServiceRequestDto {

	private Long request_no;
	private Long cs_no;
	private String title;
	private String content;
	private LocalDate reg_date;
}
