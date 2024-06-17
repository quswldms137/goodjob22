package com.example.goodjob.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dao.IRecruitListDao94;
import com.example.goodjob.dto.RecruitDto;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/recruit94")
public class RecruitController_94 {
	@Autowired
	IRecruitListDao94 recuListDao;
	

	//채용공고리스트
	@GetMapping("/recruitList")
	public List<RecruitDto> recruitList(){
		System.out.println(recuListDao.getRecruitListDto());
		return recuListDao.getRecruitListDto();
	}
}