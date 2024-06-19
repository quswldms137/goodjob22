package com.example.goodjob.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dto.CompanyDto;
import com.example.goodjob.dto.MemberDto;
import com.example.goodjob.service.CompanyService99;
import com.example.goodjob.service.MemberService99;
import com.example.goodjob.service.PasswordService99;
import com.example.goodjob.service.UserService99;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/api/join")
public class JoinController_99 {

	@Autowired
	private UserService99 userService;
	@Autowired
	private MemberService99 memberService;
	@Autowired
	private CompanyService99 companyService;
	@Autowired
	private PasswordService99 passwordService;
	
	
	@PostMapping("/member")
	public ResponseEntity<String> joinMember(@RequestBody MemberDto memberDto, HttpSession session) {
		System.out.println("memberDto : " + memberDto);
		
		//username이 Manager라면 관리자 권한 부여
		if(memberDto.getUsername().equals("manager")) {
			memberDto.setRole("ROLE_MANAGER");
		}
		//가입일자
		LocalDate today = LocalDate.now();
		memberDto.setMake_date(today);
		//비밀번호 암호화
		String password = memberDto.getPassword();
		String hashedPassword = passwordService.hashPassword(password);
		memberDto.setPassword(hashedPassword);
		
		int result = userService.regUser(memberDto);

		int result2 = memberService.regMember(memberDto);
		
		if(result == 1 && result2 == 1) {
			return ResponseEntity.ok("성공적으로 가입이 완료되었습니다~! \n취뽀!!");
		} else {
			return ResponseEntity.badRequest().body("가입실패");
		}
	}
	
	@PostMapping("/company")
	public ResponseEntity<String> joinCompany(@RequestBody CompanyDto companyDto) {
		System.out.println("companyDto : " + companyDto);
		//비밀번호 암호화
		String password = companyDto.getPassword();
		String hashedPassword = passwordService.hashPassword(password);
		companyDto.setPassword(hashedPassword);
		
		int result = userService.regUser(companyDto);

		int result2 = companyService.regCompany(companyDto);
		
		if(result == 1 && result2 == 1) {
			return ResponseEntity.ok("성공적으로 가입이 완료되었습니다.");
		} else {
			return ResponseEntity.badRequest().body("가입실패");
		}
	}
}
