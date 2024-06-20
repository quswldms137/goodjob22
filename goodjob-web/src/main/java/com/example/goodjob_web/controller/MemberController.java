package com.example.goodjob_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/member")
public class MemberController {
	
	@GetMapping("/mypage")
	public String mypage() {
		return "mypage";
	}
	
	@GetMapping("/info")
	public String info() {
		return "updateMemberInfo";
	}
	
	@GetMapping("/applyList")
	public String applyList() {
		
		return "member/applyList";
	}
}
