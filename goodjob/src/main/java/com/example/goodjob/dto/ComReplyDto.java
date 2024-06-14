package com.example.goodjob.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ComReplyDto {

	private Long com_reply_no;
	private Long com_community__no;
	private String content;
	private Date regdate;
}
