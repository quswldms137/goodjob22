package com.example.goodjob.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dao.ICompanyDetailDao_JYC;
import com.example.goodjob.dao.IMemRecruitDao_94;
import com.example.goodjob.dao.IRecruitListDao94;
import com.example.goodjob.dto.MemRecruitDto;
import com.example.goodjob.dto.RecruitAllDto94;
import com.example.goodjob.dto.RecruitDto;
import com.example.goodjob.service.QnaService99;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/recruit94")
public class RecruitController_94 {
	@Autowired
	QnaService99 iquadao;
	@Autowired
	IRecruitListDao94 recuListDao;
	@Autowired
	IMemRecruitDao_94 memRecuDao;
	@Autowired
	ICompanyDetailDao_JYC comDetailDao;
	
	//해당기업의 채용공고리스트
	@GetMapping("/recruitList")
	public List<RecruitDto> recruitList(@RequestParam("com_no") Long com_no){
		List<RecruitDto> list = recuListDao.getRecruitListDto(com_no);
		list.forEach(recruitDto -> {
			recruitDto.setCom_detail_no(comDetailDao.getCom_detail_no(com_no));
		});
		
		return list;
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
	
	//채용공고목록페이지 - 공고 지원하기 버튼 
	@PostMapping("/nowApply")
	public String nowApply(@RequestHeader("username") String username, @RequestParam("recruit_no") Long recruit_no) {
		// username을 통해 mem_no 조회
		Long mem_no = iquadao.getMem_no(username);
		System.out.println("mem_no====================="+mem_no);
		Long resume_no = memRecuDao.getResumeNum(mem_no);
		
		int result = memRecuDao.nowApply(resume_no, recruit_no);
		if(result > 0) {
			return "해당 공고에 지원 성공하셨습니다😎";
		} else {
		       return "지원에 실패 하셨습니다😵";
		}
	}
}