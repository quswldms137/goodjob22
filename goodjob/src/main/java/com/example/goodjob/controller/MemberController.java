package com.example.goodjob.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dto.MemberDto;
import com.example.goodjob.service.MemberService;

@RestController
@RequestMapping("/api/member")
public class MemberController {

	private MemberService memberService;
	
	public MemberController(MemberService memberSerivce) {
		
		this.memberService = memberService;
	}
	
	@GetMapping("/info/{username}")
	public MemberDto getInfo(@PathVariable("username") String username) {
		
		MemberDto memberDto = memberService.getInformation(username);
		return memberDto;
	}
	
	@PostMapping("/info")
	public MemberDto getInfo(@RequestBody MemberDto memberDto) {
		
		memberService.saveInformation(memberDto);
		return memberDto;
	}
}
