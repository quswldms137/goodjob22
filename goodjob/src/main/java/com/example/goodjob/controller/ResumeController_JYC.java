package com.example.goodjob.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dto.ResumeDto;
import com.example.goodjob.service.ResumeService_JYC;

@CrossOrigin("http://localhost:9991")
@RestController
@RequestMapping("/api/resume")
public class ResumeController_JYC {
	
	private ResumeService_JYC resumeService;
	
	public ResumeController_JYC(ResumeService_JYC resumeService) {
		this.resumeService = resumeService;
	}
	
	@GetMapping("/main/{username}")
	public ResponseEntity<ResumeDto> getMainResume(@PathVariable("username") String username) {
		
		ResumeDto resumeDto = resumeService.getMainResume(username);

		if(resumeDto == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST)
					.body(resumeDto);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(resumeDto);
	}

}
