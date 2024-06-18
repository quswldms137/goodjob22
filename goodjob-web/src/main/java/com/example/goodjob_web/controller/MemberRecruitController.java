package com.example.goodjob_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member93")
public class MemberRecruitController {

	@RequestMapping("/memberRecruit")
	public String memberRecruit() {
		
		return "/member/memberRecruit";
	}
	
}
