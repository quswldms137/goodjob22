package com.example.goodjob_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employ")
public class CommonController93 {

	@RequestMapping("/detail/{recruit_no}")
	public String employDetail(Model model, @PathVariable("recruit_no") Long recruit_no) {
		model.addAttribute("recruit_no", recruit_no);
		return "common/recruitDetail";
	}
	
}
