package com.example.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dto.CompanyDetailDto97;
import com.example.goodjob.dto.CompanyDto;
import com.example.goodjob.dto.MemRecruitDto;
import com.example.goodjob.dto.RecruitDetailDto;
import com.example.goodjob.dto.RecruitDto;
import com.example.goodjob.dto.ScrapRecruitDto;
import com.example.goodjob.service.MemRecruitService;
import com.example.goodjob.service.QnaService99;
import com.example.goodjob.service.RecruitCompanyDetailService;
import com.example.goodjob.service.RecruitService93;
import com.example.goodjob.service.ScrapRecruitService93;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/recruit")
public class RecruitController93 {

	@Autowired
	private RecruitService93 recruitService;
	
	@Autowired
	private RecruitCompanyDetailService companyDetailService;
	
	@Autowired
	private MemRecruitService memRecruitService;
	
	@Autowired
	private QnaService99 qnaService99;
	
	@Autowired
	private ScrapRecruitService93 scrapRecruitService;
	
	@GetMapping("/detail")
	public RecruitDetailDto recruitDetail(@RequestParam("recruit_no") Long recruit_no,
			@RequestParam("com_no") Long com_no, @RequestParam("com_detail_no") Long com_detail_no) {
		
		RecruitDto recruitDto = recruitService.recruitDetailService(recruit_no, com_no);
		CompanyDto companyDto = companyDetailService.getCompanyService(com_no);
		CompanyDetailDto97 companyDto2 = companyDetailService.getCompanyService2(com_detail_no, com_no);
		
		return new RecruitDetailDto(recruitDto, companyDto, companyDto2);
	}
	
	@PostMapping("/nowApply")
    public ResponseEntity<String> nowApply(@RequestBody MemRecruitDto memRecruitDto,
    		@RequestHeader("username") String username) {
		
		Long mem_no = qnaService99.getMem_no(username);
		
        int result = memRecruitService.nowApplyService(memRecruitDto.getRecruit_no(), mem_no);
        if(result > 0) {
        	return ResponseEntity.ok("해당 공고에 지원 성공하셨습니다😎"); 
        }
        
        return ResponseEntity.ok("즉시지원 실패");
    }
	
	@PostMapping("/nowScrap")
	public ResponseEntity<String> nowScrap(@RequestBody ScrapRecruitDto scrapRecruitDto,
			@RequestHeader("username") String username){
		
		Long mem_no = qnaService99.getMem_no(username);
		
		scrapRecruitDto.setMem_no(mem_no);
		
		scrapRecruitService.scrapRecruitRegService(scrapRecruitDto);
		
		return ResponseEntity.ok("해당 채용공고가 스크랩 되었습니다🤩");
		
	}
	
	@GetMapping("/applyChk")
	public ResponseEntity<String> applyChk(@RequestParam("resume_no") Long resume_no, @RequestParam("recruit_no") Long recruit_no){
		
		int result = memRecruitService.applyChkService(resume_no, recruit_no);
		
		if(result == 1) {
			return ResponseEntity.ok("지원한공고");
		}
		return ResponseEntity.ok("지원한공고 아님");
	}
	
	
	
	
	
	
	
	
	
}
