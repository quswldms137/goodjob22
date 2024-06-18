package com.example.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dao.IComInterestDao_94;
import com.example.goodjob.dao.IScrapRecruitDao_94;
import com.example.goodjob.dto.ComInterestDto;
import com.example.goodjob.dto.ScrapRecruitDto;
import com.example.goodjob.service.QnaService99;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/interest")
public class ComInterstScrapController94 {
	@Autowired
	QnaService99 iquadao;
	@Autowired
	IComInterestDao_94 comInterestDao;
	@Autowired
	IScrapRecruitDao_94 scrapRecruitDao;
	
	//기업리스트 페이지 - 관심기업등록 버튼 
	@PostMapping("/add")
	public String addInterestCompany(@RequestHeader("username") String username, @RequestParam("com_no") Long com_no) {
		 // username을 통해 mem_no 조회
		Long mem_no = iquadao.getMem_no(username);
		System.out.println("mem_no====================="+mem_no);
		ComInterestDto comInterestDto = new ComInterestDto();
		comInterestDto.setCom_no(com_no);
		comInterestDto.setMem_no(mem_no);
		// 관심기업 등록 DAO 호출
		int result = comInterestDao.addInterestCompany(mem_no, com_no);
		if(result > 0) {
			return "관심기업이 등록되었습니다!";
		} else {
	        return "관심기업 등록에 실패했습니다.";
	    }
	}
	
	//채용공고목록페이지 - 공고 스크랩 등록 버튼 
	@PostMapping("/addScrap")
	public String addScrap(@RequestHeader("username") String username, @RequestParam("recruit_no") Long recruit_no) {
		 // username을 통해 mem_no 조회
		Long mem_no = iquadao.getMem_no(username);
		System.out.println("mem_no====================="+mem_no);
		ScrapRecruitDto scrapRecruitDto = new ScrapRecruitDto();
		scrapRecruitDto.setRecruit_no(recruit_no);
		scrapRecruitDto.setMem_no(mem_no);

		int result = scrapRecruitDao.addScrap(mem_no, recruit_no);
		if(result > 0) {
			return "해당 채용공고가 스크랩 되었습니다!";
		} else {
	        return "스크랩에 실패했습니다.";
	    }
	}
}
