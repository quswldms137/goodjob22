package com.example.goodjob.controller;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dto.ServiceQuestionDto;
import com.example.goodjob.service.ServiceQuestionService;

@CrossOrigin("http://localhost:9991/")
@RestController
@RequestMapping("/api/qna")
public class QnaController {

	private ServiceQuestionService serviceQuestionService;
	
	public QnaController(ServiceQuestionService serviceQuestionService) {
		this.serviceQuestionService = serviceQuestionService;
	}
	
	@GetMapping("/{username}")
	public String getQna(@PathVariable("username") String username) {
		
		return "행복하세요";
	}
}
