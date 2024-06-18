package com.example.goodjob_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/qna99")
public class QnAController99 {

	@RequestMapping("/qnaWrite")
	public String qnaWriteForm() {
		
		return "common/qnaWrite";
	}
	
	@RequestMapping("/qnaDetail")
	public String qnaDetail() {
		
		return "common/qnaDetail";
	}
	
	
}
