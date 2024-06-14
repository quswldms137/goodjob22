package com.example.goodjob.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CompanyDto_JYC {

	private Long com_no;
	private String username;
	private String com_name;
	private String com_type;
	private String com_ceo;
	private String com_addr;
	private String com_companynum;
	private String com_tel;
	private String com_email;
	
	private Long com_detail_no;
	private String introdiction;
	private String img_url;
	private String pension;
	private String compensation;
	private String facilities;
	private String policy;
	private String convenience;
	private String sectors;
	private String history;
	private String ideal_talent;
	private Date foundation;
	private int amount;
	private String url;
	
}
