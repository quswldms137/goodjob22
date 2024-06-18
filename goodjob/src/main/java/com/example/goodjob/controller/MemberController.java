package com.example.goodjob.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dto.MemberDto;
import com.example.goodjob.dto.RecruitDto_JYC;
import com.example.goodjob.dto.UserDto;
import com.example.goodjob.service.MemberService;
import com.example.goodjob.service.SkillService_JYC;
import com.example.goodjob.service.UserService;

@CrossOrigin("http://localhost:9991")
@RestController
@RequestMapping("/api/member")
public class MemberController {

	private MemberService memberService;
	private SkillService_JYC skillService;
	private UserService userService;
	
	public MemberController(MemberService memberService, UserService userService, SkillService_JYC skillService) {
		this.memberService = memberService;
		this.userService = userService;
		this.skillService = skillService;
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
	public ResponseEntity<String> deleteInfo(@PathVariable("mem_no") Long mem_no, @PathVariable("username") String username) {
		
		String result = memberService.deleteInformation(mem_no, username);
		
		if(result.equals("회원탈퇴 성공")) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(result);
		}
		
		return ResponseEntity.status(HttpStatus.BAD_REQUEST)
				.body(result);
	}
	
	@GetMapping("/id/{username}")
	public String checkId(@PathVariable("username") String username) {
		
		String result = userService.checkId(username);
		
		return result;
	}
	
	@GetMapping("/list/{page}")
	public ResponseEntity<List<MemberDto>> getMemberList(@PathVariable("page") int page){
		
		List<MemberDto> memberList = memberService.getMemberList(page);
		
		if(memberList == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST)
					.body(null);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(memberList);
	}
	
	@GetMapping("/detail/{mem_no}")
	public ResponseEntity<MemberDto> getMemberDetail(@PathVariable("mem_no") Long mem_no){
		
		MemberDto memberDto = memberService.getMemberDto(mem_no);
		
		if(memberDto == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST)
					.body(null);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(memberDto);
	}
	
}
