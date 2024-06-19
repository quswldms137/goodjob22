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
	
	@RequestMapping("/findUsername")
	public String findUsernameForm() {
		return "common/findUsernameWrite";
	}
	
	@RequestMapping("/showUsername")
	public String resultUsername() {
		return "common/resultUsername";
	}
	
	@RequestMapping("/findPassword")
	public String findPasswordForm() {
		return "common/findPasswordWrite";
	}
	
	@RequestMapping("/newPassword")
	public String newPassword() {
		return "common/modifyPassword";
	}
}
