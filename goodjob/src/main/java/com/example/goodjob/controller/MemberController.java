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
import com.example.goodjob.dto.UserDto;
import com.example.goodjob.service.MemberService;
import com.example.goodjob.service.UserService;

@CrossOrigin("http://localhost:9991/")
@RestController
@RequestMapping("/api/member")
public class MemberController {

	private MemberService memberService;
	
	private UserService userService;
	
	public MemberController(MemberService memberService, UserService userService) {
		this.memberService = memberService;
		this.userService = userService;
	}
	
	@GetMapping("/info/{username}")
	public MemberDto getInfo(@PathVariable("username") String username) {
		
		MemberDto memberDto = memberService.getInformation(username);
		UserDto userDto = userService.getInfo(username);
		memberDto.setPassword(userDto.getPassword());
		memberDto.setRole(userDto.getRole());
		return memberDto;
	}
	
	@PostMapping("/info")
	public MemberDto saveInfo(@RequestBody MemberDto memberDto) {
		
		return memberService.saveInformation(memberDto);
	}
	
	@DeleteMapping("/info/{mem_no}/{username}")
	public String deleteInfo(@PathVariable("mem_no") Long mem_no, @PathVariable("username") String username) {
		
		String result = memberService.deleteInformation(mem_no, username);
		
		System.out.println("result : " + result);
		
		return result;
	}
	
	@GetMapping("/id/{username}")
	public String checkId(@PathVariable("username") String username) {
		
		String result = userService.checkId(username);
		
		return result;
	}
}
