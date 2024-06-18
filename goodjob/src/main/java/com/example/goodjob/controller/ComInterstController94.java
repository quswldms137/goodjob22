package com.example.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dao.IComInterestDao_94;
import com.example.goodjob.dto.MemInterestDto;
import com.example.goodjob.service.QnaService99;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/interest")
public class ComInterstController94 {
	@Autowired
	IComInterestDao_94 comInterestDao;
	@Autowired
	QnaService99 iquadao;
	
	@PostMapping("/add")
	public String addInterestCompany(@RequestHeader("username") String username, @RequestParam("com_no") Long com_no) {
		 // username을 통해 mem_no 조회
		Long mem_no = iquadao.getMem_no(username);
		System.out.println("mem_no====================="+mem_no);
		MemInterestDto memInterestDto = new MemInterestDto();
		memInterestDto.setCom_no(com_no);
		memInterestDto.setMem_no(mem_no);
		// 관심기업 등록 DAO 호출
		int result = comInterestDao.addInterestCompany(mem_no, com_no);
		if(result > 0) {
			return "관심기업이 등록되었습니다!";
		} else {
	        return "관심기업 등록에 실패했습니다.";
	    }
	}
}
