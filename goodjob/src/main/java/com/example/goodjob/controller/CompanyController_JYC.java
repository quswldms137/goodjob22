package com.example.goodjob.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dto.CompanyDto_JYC;
import com.example.goodjob.dto.MemberDto;
import com.example.goodjob.service.CompanyService_JYC;

@CrossOrigin("http://localhost:9991/")
@RestController
@RequestMapping("/api/company/")
public class CompanyController_JYC {

	private CompanyService_JYC companyService;
	
	public CompanyController_JYC(CompanyService_JYC companyService) {
		this.companyService = companyService;
	}
	
	@GetMapping("/list/{page}")
	public ResponseEntity<List<CompanyDto_JYC>> getCompanyList(@PathVariable("page") int page){

		List<CompanyDto_JYC> companyList = companyService.getCompanyList(page);
		
		if(companyList == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST)
					.body(null);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(companyList);
	}
	
	@GetMapping("/detail/{com_no}")
	public ResponseEntity<CompanyDto_JYC> getMemberDetail(@PathVariable("com_no") Long com_no){
		
		CompanyDto_JYC companyDto = companyService.getCompanyDto(com_no);
		
		System.out.println("companyDto : " + companyDto);
		
		if(companyDto == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST)
					.body(null);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(companyDto);
	}
	
	@DeleteMapping("/info/{com_no}/{username}")
	public ResponseEntity<String> deleteInfo(@PathVariable("com_no") Long com_no, @PathVariable("username") String username) {
		
		String result = companyService.deleteInformation(com_no, username);
		
		if(result.equals("회원 삭제 성공.")) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(result);
		}
		
		return ResponseEntity.status(HttpStatus.BAD_REQUEST)
				.body(result);
	}	
}
