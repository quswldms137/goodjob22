package com.example.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dto.MemberDto;
import com.example.goodjob.service.MemberService;

@CrossOrigin("http://localhost:9991/")
@RestController
@RequestMapping("/api/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@GetMapping("/info/{username}")
	public MemberDto getInfo(@PathVariable("username") String username) {
		
		MemberDto memberDto = memberService.getInformation(username);
		
		return memberDto;
	}
	
	@PostMapping("/info")
	public MemberDto saveInfo(@RequestBody MemberDto memberDto) {
		
		return memberService.saveInformation(memberDto);
	}
	
	@DeleteMapping("/info/{mem_no}/{username}")
	public String deleteInfo(@PathVariable("mem_no") Long mem_no, @PathVariable("username") String username) {
		
		String result = memberService.deleteInformation(mem_no, username);
		
		return result;
	}
}
