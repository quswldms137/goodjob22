package com.example.goodjob.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dao.ICompanyDao_JHY;
import com.example.goodjob.dto.RecruitDto;

@CrossOrigin("http://localhost:9991/")
@RestController
@RequestMapping("/api/company")
public class CompanyController_JHY {
	
	@Autowired
	private ICompanyDao_JHY companyDao;
	
	@GetMapping("/index")
	public List<RecruitDto> main() {
		
		List<RecruitDto> list = companyDao.findAll();
		System.out.println(list);
		return list;
	}
	
	@PostMapping("/employWrite")
	public String employ(@RequestBody RecruitDto recruitDto) {
		
		boolean tf = companyDao.recruitWrite(recruitDto);
		System.out.println(recruitDto);
		if(tf == true) {
			return "채용공고 등록에 성공했습니다.";
		}else {
			return "채용공고 등록에 실패했습니다.";
		}
		
	}
	
	
	
	
	
	
	
	
}
