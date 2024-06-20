package com.example.goodjob.dto;

import java.time.LocalDate;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecruitDto {

	private Long recruit_no;
	private Long com_no;
	private String username;
	private String career;
	private String education;
	private String field;
	private int pay;
	private String location;
	private String working_time;
	private String rank;
	private String title;
	private String qualification;
	private String welfare;
	private String seprocedure;
	private String notice;
	private LocalDate reg_date;
	private LocalDate deadline_date;
	private String p_number;
	private String recruit_intro;
	private List<String> skill;
	private Long com_detail_no;
}
