package com.example.goodjob.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dto.MemRecruitDto;
import com.example.goodjob.dto.ResumeDto;
import com.example.goodjob.service.ResumeService_JYC;

@CrossOrigin("*")
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

		if (resumeDto == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(resumeDto);
		}

		return ResponseEntity.status(HttpStatus.OK).body(resumeDto);
	}

	@GetMapping("/mylist/{username}")
	public ResponseEntity<List<MemRecruitDto>> getMyMemRecruitList(@PathVariable("username") String username) {

		List<MemRecruitDto> result = resumeService.getMyMemRecruitList(username);

		if (result != null) {

			return ResponseEntity.status(HttpStatus.OK).body(result);
		}
		
		return ResponseEntity.status(HttpStatus.BAD_REQUEST)
				.body(null);
	}
	
	@DeleteMapping("/mylist")
	public ResponseEntity<String> deleteMemRecruit(@RequestParam("mem_recruit_no") Long mem_recruit_no){

		System.out.println("mem_recruit_no : " + mem_recruit_no);
		
		String result = resumeService.deleteMemRecruit(mem_recruit_no);
		
		System.out.println("result : " + result);
		
		if(result.equals("지원 취소 성공했습니다.")) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(result);
		}
		
		return ResponseEntity.status(HttpStatus.BAD_REQUEST)
				.body(null);
	}

}
