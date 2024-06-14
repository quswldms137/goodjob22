package com.example.goodjob.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CompanyDto {

	private Long com_no;
	private String username;
	private String password;
	private String role;
	private String com_name;
	private String com_type;
	private String com_ceo;
	private String com_addr;
	private String com_companynum;
	private String com_tel;
	private String com_email;
}
