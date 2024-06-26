package com.example.goodjob.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CompanyDetailDto94 {

	private Long com_detail_no;
	private Long com_no;
	private String introdiction;
	private String img_url;
	private String pension;
	private String sectors;
	private String history;
	private String ideal_talent;
	private Date foundation;
	private int amount;
	private String url;
	
	private String com_name;
	private String com_type; 
	private String com_ceo; 
	private String com_addr;  
	
	private String location;
	
}
