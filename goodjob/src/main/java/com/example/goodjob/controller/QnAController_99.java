package com.example.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dto.ServiceQuestionDto;
import com.example.goodjob.service.QnaService99;

@RestController
@RequestMapping("/api/qna-99")
public class QnAController_99 {

	@Autowired
	private QnaService99 qnaService;
	
	@PostMapping
	public ResponseEntity<String> regQuestion(@RequestBody ServiceQuestionDto serviceQuestionDto) {
		System.out.println("실행,,,,");
		
		System.out.println(serviceQuestionDto);
		int result = qnaService.regQuestion(serviceQuestionDto);
		
		if(result == 1) {
			return ResponseEntity.ok("문의가 접수되었습니다.");
		}
		
		return ResponseEntity.badRequest().body("다시 입력해주세요.");
	}
	
}
