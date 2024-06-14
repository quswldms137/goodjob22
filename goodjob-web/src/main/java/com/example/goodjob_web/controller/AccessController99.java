package com.example.goodjob_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AccessController99 {

	@RequestMapping("/access")
	public String access() {
		
		return "access403";
	}
}
