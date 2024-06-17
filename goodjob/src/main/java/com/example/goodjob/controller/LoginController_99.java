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

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/login")
public class LoginController_99 {

    @Autowired
    private UserService99 userService;

    @PostMapping
    public ResponseEntity<String> loginMember(@RequestBody UserDto userDto, HttpSession session, HttpServletResponse response) {
        String role = userService.getRole(userDto);
        userDto.setRole(role);
        System.out.println("role: " + role);
        System.out.println("userDto: " + userDto);
        
        int result = userService.userLogin(userDto);
        if (result == 1) {
            System.out.println(result);
            if ("ROLE_MEMBER".equals(role) || "ROLE_MANAGER".equals(role) || "ROLE_COMPANY".equals(role)) {
                session.setAttribute("user", userDto);
                System.out.println("Saved in session: " + session.getAttribute("user"));
                //Header에 저장
                response.setHeader("username", userDto.getUsername());
                response.setHeader("role", userDto.getRole());
                response.addHeader("Access-Control-Expose-Headers", "username, role");
                
                if("ROLE_COMPANY".equals(role)) {
                	return ResponseEntity.ok().body("{\"redirectUrl\": \"http://localhost:9991/company/index\"}");
                } 
            } 
        	return ResponseEntity.ok().body("{\"redirectUrl\": \"http://localhost:9991/common99\"}");

        } else {
            return ResponseEntity.badRequest().body("아이디 또는 비밀번호가 일치하지 않습니다.");
        }
    }

    @PostMapping("/logout")
    public ResponseEntity<String> logout(HttpServletRequest request){
    	HttpSession session = request.getSession(false);
    	
    	if(session != null) {
    		session.invalidate();
    		return ResponseEntity.ok("{\"redirectUrl\": \"http://localhost:9991/common99\"}");
    	} else {
    		return ResponseEntity.badRequest().body("다시 시도해주세요.");
    	}
    	
    }
}
