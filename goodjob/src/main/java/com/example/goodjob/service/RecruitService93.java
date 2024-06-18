package com.example.goodjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.goodjob.dao.IRecruitDao93;
import com.example.goodjob.dto.RecruitDto;

@Service
public class RecruitService93 {
	
	@Autowired
	private IRecruitDao93 dao93;
	
	public RecruitDto recruitDetailService(@RequestParam("recruit_no") Long recruit_no,
			@RequestParam("com_no") Long com_no) {
		
		return dao93.recruitDetail(recruit_no, com_no);
	}

}
