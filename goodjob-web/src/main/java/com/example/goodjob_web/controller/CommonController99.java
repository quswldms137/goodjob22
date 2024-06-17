package com.example.goodjob_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common99")
public class CommonController99 {

	@RequestMapping
	public String index() {
		return "common/index";
	}
	
	@RequestMapping("/login")
	public String loginForm() {
		return "common/login";
	}
	
	@RequestMapping("/join")
	public String joinForm() {
		return "common/join";
	}
}
