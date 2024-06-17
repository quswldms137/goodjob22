package com.example.goodjob_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/resume")
public class ResumeController {
	
	@RequestMapping("/resumeManage")
	public String resumeManage() {
		
		return "resume/resumeManage";
	}
	
	@RequestMapping("/resumeWrite")
	public String resumeWrite() {
		
		return "resume/resumeWrite";
	}
	
	@RequestMapping("/resumeDetail")
	public String resumeDetail() {
		
		return "resume/resumeDetail";
	}

}
