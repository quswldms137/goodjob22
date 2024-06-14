package com.example.goodjob.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class ComCommunityDto {
	private Long com_community__no;
	private Long com_no;
	private String title;
	private String content;
	private Date regdate;
	private String category;
	private Long views;
}
