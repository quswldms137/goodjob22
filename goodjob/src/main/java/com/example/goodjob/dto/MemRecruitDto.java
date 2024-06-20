package com.example.goodjob.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemRecruitDto {
	private Long mem_recruit_no;
	private Long resume_no;
	private Long recruit_no;
	private int resume_pass;
	private boolean view;
	private int interview_pass;
}
