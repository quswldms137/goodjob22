package com.example.goodjob.config;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.example.goodjob.dto.UserDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
/*
@Component
public class UserInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		HttpSession session = request.getSession(false);
		UserDto user = getSessionUser(session);
		System.out.println("user2 : " + user);
		if(user != null) {
			String path = request.getRequestURI();
			
			if(path.startsWith("/admin") && !user.getRole().equals("ROLE_MANAGER")){
				response.sendRedirect("/access");
				//response.setStatus(HttpServletResponse.SC_FORBIDDEN);
				return false;
			} else if(path.startsWith("/member") && !(user.getRole().equals("ROLE_MEMBER") || user.getRole().equals("ROLE_MANAGER"))) {
				response.sendRedirect("/access");
//				response.setStatus(HttpServletResponse.SC_FORBIDDEN);
				return false;
			} else if(path.startsWith("/company94")||path.startsWith("/company") && !(user.getRole().equals("ROLE_COMPANY") || user.getRole().equals("ROLE_MANAGER"))) {
				response.sendRedirect("/access");
//				response.setStatus(HttpServletResponse.SC_FORBIDDEN);
				return false;
			}
		}
		return true;
	}
	
	public UserDto getSessionUser(HttpSession session) {
		UserDto user = (UserDto) session.getAttribute("loginMember");
		if(user == null) {
			user = (UserDto) session.getAttribute("loginCompany");
		}
		if(user == null) {
			user = (UserDto) session.getAttribute("loginManager");
		}
		System.out.println("user : " + user);
		return user;
	}
}*/
