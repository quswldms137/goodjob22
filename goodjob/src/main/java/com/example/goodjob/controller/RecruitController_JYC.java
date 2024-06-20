package com.example.goodjob.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dto.RecruitDto_JYC;
import com.example.goodjob.service.RecruitService_JYC;
import com.example.goodjob.service.SkillService_JYC;

@CrossOrigin("http://localhost:9991")
@RestController
@RequestMapping("/api/recruit")
public class RecruitController_JYC {

	private SkillService_JYC skillService;
	private RecruitService_JYC recruitService;
	
	
	public RecruitController_JYC(SkillService_JYC skillService, RecruitService_JYC recruitService) {
		this.skillService = skillService;
		this.recruitService = recruitService;
	}
	
	@GetMapping("/skill/{username}")
	public ResponseEntity<List<RecruitDto_JYC>> getSkillMatching(@PathVariable("username") String username) {
		
		List<RecruitDto_JYC> result = skillService.getSkillMatching(username);
		
		
		if(result == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST)
					.body(null);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(result);
				
	}
	
	@GetMapping("/vip")
	public ResponseEntity<List<RecruitDto_JYC>> getVip(){
		
		List<RecruitDto_JYC> result = recruitService.getVip();
		
		if(result == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST)
					.body(null);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(result);
	}
	
	@GetMapping("/all")
	public ResponseEntity<List<RecruitDto_JYC>> getAll(){
		
		List<RecruitDto_JYC> result = recruitService.getAll();
		
		if(result == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST)
					.body(null);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(result);
	}
}
