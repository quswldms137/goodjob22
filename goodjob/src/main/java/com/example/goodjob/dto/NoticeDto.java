package com.example.goodjob.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeDto {
	
	private Long notice_no;
	private Long mem_no;
	private String title;
	private String content;
	private LocalDate reg_date;
	private String category;
	private String notice_img;
	
}
