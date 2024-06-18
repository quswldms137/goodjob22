package com.example.goodjob.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dao.IRecruitListDao94;
import com.example.goodjob.dto.RecruitAllDto94;
import com.example.goodjob.dto.RecruitDto;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/recruit94")
public class RecruitController_94 {
	@Autowired
	IRecruitListDao94 recuListDao;
	
	//해당기업의 채용공고리스트
	@GetMapping("/recruitList")
	public List<RecruitDto> recruitList(@RequestParam("com_no") Long com_no){
		System.out.println("해당기업채용공고리스트:" + recuListDao.getRecruitListDto(com_no));
		return recuListDao.getRecruitListDto(com_no);
	}
	
	//전체 채용공고 리스트
	@GetMapping("/allRecruitList")
	public List<RecruitAllDto94> allRecruitList(){
		System.out.println("전체채용공고리스트:" + recuListDao.getAllRecruitDto());
		return recuListDao.getAllRecruitDto();
	}
}