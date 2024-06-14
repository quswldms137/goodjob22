package com.example.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dto.UserDto;
import com.example.goodjob.service.UserService99;

import jakarta.servlet.http.HttpSession;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/login")
public class LoginController_99 {

	@Autowired
	private UserService99 userService;
	
	@PostMapping
	public ResponseEntity<String> login(@RequestBody UserDto userDto, HttpSession session) {
		/*
		String result = userService.getRole(userDto);
		System.out.println("role: " + result);
		if("ROLE_MEMBER".equals(result)) {
			session.setAttribute("loginMember", userDto);
			System.out.println("Saved in session: " + session.getAttribute("loginMember"));
		} else if("ROLE_COMPANY".equals(result)) {
			session.setAttribute("loginCompany", userDto);
			System.out.println("Saved in session: " + session.getAttribute("loginCompany"));
		} else if("ROLE_MANAGER".equals(result)){
			session.setAttribute("loginManager", userDto);
			System.out.println("Saved in session: " + session.getAttribute("loginManager"));
		} */

		boolean isValidUser = authenticate(userDto);
		
		System.out.println(isValidUser);
		if(isValidUser) {
			return ResponseEntity.ok().body("환영합니당~");
		} 
		return ResponseEntity.badRequest().body("{\"message\": \"아이디 또는 비밀번호가 일치하지 않습니다.\" }");
	}
	
	private boolean authenticate(UserDto user) {
		boolean result = false;
		int result2 = userService.userLogin(user);
		if(result2 == 1) {
			result = true;
		}
		return result;
	}
}
