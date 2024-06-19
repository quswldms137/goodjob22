package com.example.goodjob.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dao.IRecruitListDao94;
import com.example.goodjob.dto.CompanyDetailDto94;
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
	
	//채용공고목록 페이지 - 필터(직무/지역/기업형태)
	@GetMapping("/filterList")								//필터링위해 파라미터를 선택적으로 받기 
	public List<RecruitAllDto94> getFilterRecruitList(@RequestParam(value = "sectors", required = false) String sectors,
													  @RequestParam(value = "location", required = false) String location,
													  @RequestParam(value = "com_type", required = false) String com_type){
		System.out.println("필터채용공고리스트:" + recuListDao.getFilterRecruitList(sectors, location, com_type));
		return recuListDao.getFilterRecruitList(sectors, location, com_type);
	}
	
	//채용공고 검색창 
	@GetMapping("/searchRecruit")
	public List<RecruitAllDto94> getSearchRecruit(@RequestParam("query") String searchQuery) {
		System.out.println(recuListDao.getSearchRecruit(searchQuery));
		return recuListDao.getSearchRecruit(searchQuery);
	}
}