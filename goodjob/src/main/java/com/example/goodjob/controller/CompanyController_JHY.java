package com.example.goodjob.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dao.ICompanyDao_JHY;
import com.example.goodjob.dto.RecruitDto;
import com.example.goodjob.dto.SkillDto;

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
	
	@PostMapping("/employWrite")//, SkillDto skillDto
	public String employWrite(@RequestBody RecruitDto recruitDto) {
		boolean tf = companyDao.recruitWrite(recruitDto);
		System.out.println(recruitDto);
		List<RecruitDto> recruit = companyDao.findLatest(1L);
		System.out.println(recruit);
		Long recruit_no = recruit.get(0).getRecruit_no();
		System.out.println(recruit_no);
		List<String> skill = recruitDto.getSkill();
		System.out.println(skill);
		for(String sk_name : skill) {
			companyDao.regSkill(sk_name, recruit_no);
		}
		if(tf == true ) {
			return "채용공고 등록에 성공했습니다.";
		}else {
			return "채용공고 등록에 실패했습니다.";
		}
		
	}
	
	@PutMapping("/employUpdate")
	public RecruitDto employUpdate(@RequestParam("recruit_no") Long recruit_no) {
		
		RecruitDto recruit = companyDao.findByRecruit_no(recruit_no);
		
		return recruit;
	}
	
	@DeleteMapping("/deleteRecruit")
	public String deleteRecruit(@RequestParam("recruit_no") Long recruit_no) {
		
		boolean tf = companyDao.delete(recruit_no);
		String str = "";
		if(tf == true) {
			str = "삭제 성공";
		}else {
			str = "삭제 실패";
		}
		
		return str;
	}
	
	
	
	
	
}
