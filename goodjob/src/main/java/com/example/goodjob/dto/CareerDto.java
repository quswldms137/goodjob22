package com.example.goodjob.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CareerDto {

	private Long career_no;
	private Long resume_no;
	private String company;
	private LocalDate car_join_date;
	private LocalDate quit_date;
	private String main_part;
}
