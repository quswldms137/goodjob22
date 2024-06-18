package com.example.goodjob.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberDto {

	private Long mem_no;
	private String username;
	private String password;
	private String role;
	private String mem_name;
	private String mem_tel;
	private String mem_email;
	private String mem_gender;

	private LocalDate make_date;
	private String mem_birth;
	private String mem_addr;
	
	private int total;
}
