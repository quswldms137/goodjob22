package com.example.goodjob.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemInterestDto_JYC {

	private String username;
	private Long mem_interest_no;
	private Long mem_no;
	private Long com_no;
}
