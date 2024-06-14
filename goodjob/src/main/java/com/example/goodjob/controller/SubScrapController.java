package com.example.goodjob.controller;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dto.CompanyDto_JYC;
import com.example.goodjob.dto.MemInterestDto;
import com.example.goodjob.dto.MemInterestDto_JYC;
import com.example.goodjob.dto.RecruitDto_JYC;
import com.example.goodjob.dto.ScrapRecruitDto;
import com.example.goodjob.dto.ScrapRecruitDto_JYC;
import com.example.goodjob.service.MemInterestService;
import com.example.goodjob.service.MemberService;
import com.example.goodjob.service.ScrapRecruitService;


@CrossOrigin("http://localhost:9991/")
@RestController
@RequestMapping("/api/subscrap")
public class SubScrapController {

	private MemberService memberService;
	private MemInterestService memInterestService;
	private ScrapRecruitService scrapRecruitService;
	
	public SubScrapController(MemberService memberService, MemInterestService memInterestService, ScrapRecruitService scrapRecruitService) {
		this.memberService = memberService;
		this.memInterestService = memInterestService;
		this.scrapRecruitService = scrapRecruitService;
	}
	
	@GetMapping("/subscribe/{username}")
	public List<CompanyDto_JYC> getSubscribe(@PathVariable("username") String username){
		
		Long mem_no = memberService.getMem_no(username);
		
		List<CompanyDto_JYC> result = memInterestService.getSubscribeList(mem_no);
		
		return result;
	}
	
	@GetMapping("/scrap/{username}")
	public List<RecruitDto_JYC> getScrap(@PathVariable("username") String username){
		
		Long mem_no = memberService.getMem_no(username);
		
		List<RecruitDto_JYC> result = scrapRecruitService.getScrapList(mem_no);
		
		return result;
	}
	
	@PostMapping("/scrap")
	public String scrap(@RequestBody ScrapRecruitDto_JYC scrapRecruitDto) {
		
		Long mem_no = memberService.getMem_no(scrapRecruitDto.getUsername());
		
		ScrapRecruitDto scrapRecruit = new ScrapRecruitDto();
		scrapRecruit.setMem_no(mem_no);
		scrapRecruit.setRecruit_no(scrapRecruitDto.getRecruit_no());

		String result = scrapRecruitService.scrap(scrapRecruit);
	
		return result;
	}
	
	@PostMapping("/subscribe")
	public String subscribe(@RequestBody MemInterestDto_JYC memInterestDto) {
		
		Long mem_no = memberService.getMem_no(memInterestDto.getUsername());
		
		MemInterestDto memInterest = new MemInterestDto();
		memInterest.setMem_no(mem_no);
		memInterest.setCom_no(memInterestDto.getCom_no());

		String result = memInterestService.subscribe(memInterest);
	
		return result;
	}
}
