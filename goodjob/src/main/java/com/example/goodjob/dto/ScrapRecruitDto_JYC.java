package com.example.goodjob.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ScrapRecruitDto_JYC {

	private String username;
	private Long s_recruit_no;
	private Long mem_no;
	private Long recruit_no;

}
