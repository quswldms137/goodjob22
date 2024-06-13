package com.example.goodjob.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemReplyDto {
	
	private Long mem_reply_no;
	private Long mem_community_no;
	private Long mem_no;
	private String content;
	private LocalDate reg_date;
	
}
