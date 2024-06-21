package com.example.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dto.CompanyDto;
import com.example.goodjob.dto.MemberDto;
import com.example.goodjob.dto.UserDto;
import com.example.goodjob.service.PasswordService99;
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
    @Autowired
    private PasswordService99 passwordService;
    
    @PostMapping("/member")
    public ResponseEntity<String> loginMember(@RequestBody UserDto userDto, HttpSession session, HttpServletResponse response) {
        //암호화된 비밀번호 찾기
        String password = userDto.getPassword();
        String username = userDto.getUsername();
        String hashedPassword = userService.getPassword(username);
        userDto.setPassword(hashedPassword);
        String role = userService.getRole(userDto);
        userDto.setRole(role);
        //사용자가 입력한 비밀번호와 암호화된 비밀번호 비교
        boolean result = passwordService.checkPassword(password, hashedPassword);
        
        if("ROLE_MEMBER".equals(role) && result) {
        	session.setAttribute("user", userDto);
            //Header에 저장
            response.setHeader("username", userDto.getUsername());
            response.setHeader("role", userDto.getRole());
            response.addHeader("Access-Control-Expose-Headers", "username, role");
            return ResponseEntity.ok().body("{\"redirectUrl\": \"http://localhost:9991/\"}");
        } else {
        	 return ResponseEntity.badRequest().body("아이디 또는 비밀번호가 일치하지 않습니다.");
        }
    }
    
    @PostMapping("/company")
    public ResponseEntity<String> loginCompany(@RequestBody UserDto userDto, HttpSession session, HttpServletResponse response) {
        //암호화된 비밀번호 찾기
        String password = userDto.getPassword();
        String username = userDto.getUsername();
        String hashedPassword = userService.getPassword(username);
        userDto.setPassword(hashedPassword);
        String role = userService.getRole(userDto);
        userDto.setRole(role);
        //사용자가 입력한 비밀번호와 암호화된 비밀번호 비교
        boolean result = passwordService.checkPassword(password, hashedPassword);
        
        if("ROLE_COMPANY".equals(role) && result) {
        	System.out.println(result);
        	session.setAttribute("user", userDto);
            //Header에 저장
            response.setHeader("username", userDto.getUsername());
            response.setHeader("role", userDto.getRole());
            response.addHeader("Access-Control-Expose-Headers", "username, role");
            return ResponseEntity.ok().body("{\"redirectUrl\": \"http://localhost:9991/company\"}");
        } else {
        	 return ResponseEntity.badRequest().body("아이디 또는 비밀번호가 일치하지 않습니다.");
        }
    }

    @PostMapping("/admin")
    public ResponseEntity<String> loginAdmin(@RequestBody UserDto userDto, HttpSession session, HttpServletResponse response) {
        //암호화된 비밀번호 찾기
        String password = userDto.getPassword();
        String username = userDto.getUsername();
        String hashedPassword = userService.getPassword(username);
        userDto.setPassword(hashedPassword);
        String role = userService.getRole(userDto);
        userDto.setRole(role);
        //사용자가 입력한 비밀번호와 암호화된 비밀번호 비교
        boolean result = passwordService.checkPassword(password, hashedPassword);
        
        if("ROLE_MANAGER".equals(role) && result) {
        	System.out.println(result);
        	session.setAttribute("user", userDto);
            //Header에 저장
            response.setHeader("username", userDto.getUsername());
            response.setHeader("role", userDto.getRole());
            response.addHeader("Access-Control-Expose-Headers", "username, role");
            return ResponseEntity.ok().body("{\"redirectUrl\": \"http://localhost:9991/admin\"}");
        } else {
        	 return ResponseEntity.badRequest().body("아이디 또는 비밀번호가 일치하지 않습니다.");
        }
    }
    
    @PostMapping("/logout")
    public ResponseEntity<String> logout(HttpServletRequest request){
    	HttpSession session = request.getSession();
    	System.out.println(session.getId());
    	if(session != null) {
    		session.invalidate();
    		return ResponseEntity.ok("{\"redirectUrl\": \"http://localhost:9991/\"}");
    	} else {
    		return ResponseEntity.badRequest().body("다시 시도해주세요.");
    	}
    }
    
    @PostMapping("/mem-username")
	public ResponseEntity<String> getMemUsername(@RequestBody MemberDto memberDto){
		String memUsername = userService.getMemUsername(memberDto.getMem_name(), memberDto.getMem_tel());
		System.out.println("memusername" + memUsername);
		
		if(memUsername != null) {
			return ResponseEntity.ok(memUsername);
		} else {
			return ResponseEntity.badRequest().body("가입이력이 없습니다. 가입 폼으로 이동합니다.");
		}
	}
    
    @PostMapping("/com-username")
	public ResponseEntity<String> getComUsername(@RequestBody CompanyDto companyDto){
		String comUsername = userService.getComUsername(companyDto.getCom_name(), companyDto.getCom_companynum());
		System.out.println("comusername" + comUsername);
		
		if(comUsername != null) {
			return ResponseEntity.ok(comUsername);
		} else {
			return ResponseEntity.badRequest().body("가입이력이 없습니다. 가입 폼으로 이동합니다.");
		}
	}
    
    @PostMapping("/mem-password")
	public ResponseEntity<String> checkMemInfo(@RequestBody MemberDto memberDto){
		int member = userService.memCheck(memberDto);
		System.out.println(member);
		
		if(member > 0) {
			String username = memberDto.getUsername();
			System.out.println(username);
			return ResponseEntity.ok(username);
		} else {
			return ResponseEntity.badRequest().body("가입이력이 없습니다. 가입 폼으로 이동합니다.");
		}
	}
    
    @PostMapping("/com-password")
   	public ResponseEntity<String> checkComInfo(@RequestBody CompanyDto companyDto){
   		int company = userService.comCheck(companyDto);
   		System.out.println(company);
   		
   		if(company > 0) {
   			String username = companyDto.getUsername();
   			System.out.println(username);
   			return ResponseEntity.ok(username);
   		} else {
   			return ResponseEntity.badRequest().body("가입이력이 없습니다. 가입 폼으로 이동합니다.");
   		}
   	}
    
    @PutMapping("/newPassword")
    public ResponseEntity<String> newPassword(@RequestBody UserDto userDto){
    	String username = userDto.getUsername();
    	String password = userDto.getPassword();
    	String newPw = passwordService.hashPassword(password);
    	userDto.setPassword(newPw);
    	userService.modifyPassword(userDto);
    	
    	String passwordDB = userService.getMemPassword2(username);
    	
    	System.out.println("result : " + passwordDB);
    	
    	boolean result = passwordService.checkPassword(password, passwordDB);
    	
    	if(result) {
    		return ResponseEntity.ok("비밀번호 변경이 완료되었습니다.");
    	} else {
    		return ResponseEntity.badRequest().body("다시 시도해주세요.");
    	}
    }
    
    
    
}
