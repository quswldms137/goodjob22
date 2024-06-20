package com.example.goodjob_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController_JYC {

	@GetMapping("")
	public String main() {
		return "/admin/main";
	}
	
	@GetMapping("/user/list")
	public String getUserList() {
		return "/admin/userList";
	}
	
	@GetMapping("/member/detail/{mem_no}")
	public String getMemberDetail(@PathVariable("mem_no") Long mem_no, Model model) {
		
		model.addAttribute("memberNo", mem_no);
		return "/admin/memberDetail";
	}
	
	@GetMapping("/company/detail/{com_no}")
	public String getCompnayDetail(@PathVariable("com_no") Long com_no, Model model) {
		
		model.addAttribute("companyNo", com_no);
		return "/admin/companyDetail";
	}
	
	@GetMapping("/noanswer/list")
	public String getNoAnswerList() {
		return "/admin/noAnswerList";
	}
	
	@GetMapping("/yesanswer/list")
	public String getAnswerList() {
		return "/admin/yesAnswerList";
	}
	
	
	// 문의사항 작성 페이지로 이동한다.
	@GetMapping("/noanswer/answer/{cs_no}")
	public String getNoAnswerForm(@PathVariable("cs_no") Long cs_no, Model model) {
		model.addAttribute("cs_no", cs_no);
		return "/admin/answerform";
	}
	
	@GetMapping("/login")
	public String loginForm() {
		return "/admin/loginForm";
	}
	
}

