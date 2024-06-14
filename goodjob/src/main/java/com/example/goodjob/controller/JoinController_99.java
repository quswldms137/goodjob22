package com.example.goodjob.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dto.CompanyDto;
import com.example.goodjob.dto.MemberDto;
import com.example.goodjob.dto.UserDto;
import com.example.goodjob.service.MemberService99;
import com.example.goodjob.service.UserService99;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/join")
public class JoinController_99 {

	@Autowired
	private UserService99 userService;
	@Autowired
	private MemberService99 memberService;
	
	@PostMapping("/member")
	public String joinMember(@RequestBody MemberDto memberDto) {
		System.out.println("memberDto : " + memberDto);
		
		//username이 Manager라면 관리자 권한 부여
		if(memberDto.getUsername().equals("manager")) {
			memberDto.setRole("ROLE_MANAGER");
		}
		LocalDate today = LocalDate.now();
		//User 테이블
		UserDto user = new UserDto();
		user.setUsername(memberDto.getUsername());
		user.setPassword(memberDto.getPassword());
		user.setRole(memberDto.getRole());
		int result = userService.regUser(user);
		//Member 테이블
		MemberDto member = new MemberDto();
		member.setUsername(memberDto.getUsername());
		member.setMem_name(memberDto.getMem_name());
		member.setMem_tel(memberDto.getMem_tel());
		member.setMem_email(memberDto.getMem_email());
		member.setMem_gender(memberDto.getMem_gender());
		member.setMake_date(today);
		member.setMem_birth(memberDto.getMem_birth());
		member.setMem_addr(memberDto.getMem_addr());
		int result2 = memberService.regMember(member);
		
		if(result == 1 && result2 == 1) {
			return "가입완료";
		}
		return "가입실패";
	}
	
	@PostMapping("/company")
	public String joinCompany(@RequestBody CompanyDto companyDto) {
		System.out.println("memberDto : " + companyDto);
		
		LocalDate today = LocalDate.now();
		//User 테이블
		
		//Member 테이블
		return "";
	}
}
