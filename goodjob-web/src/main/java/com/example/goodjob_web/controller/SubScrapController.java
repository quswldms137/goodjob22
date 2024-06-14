package com.example.goodjob_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/subscrap")
public class SubScrapController {

	@GetMapping("/subscribe")
	public String subscribe() {
		return "subscribeList";
	}
	
	@GetMapping("/scrap")
	public String scrap() {
		return "scrapList";
	}
}
