package com.example.goodjob.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecruitDetailDto {
	
	private RecruitDto recruit;
	private CompanyDto company;
	private CompanyDetailDto97 company2;

}
