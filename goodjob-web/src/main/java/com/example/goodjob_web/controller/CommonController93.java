package com.example.goodjob_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employ")
public class CommonController93 {

	@RequestMapping("/detail/{recruit_no}/{com_no}/{com_detail_no}")
	public String employDetail(Model model, @PathVariable("recruit_no") Long recruit_no
			, @PathVariable("com_no") Long com_no, @PathVariable("com_detail_no") Long com_detail_no) {
		model.addAttribute("recruit_no", recruit_no);
		model.addAttribute("com_no", com_no);
		model.addAttribute("com_detail_no", com_detail_no);
		return "common/recruitDetail";
	}
	
}
