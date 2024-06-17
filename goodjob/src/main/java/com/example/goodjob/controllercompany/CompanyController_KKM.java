package com.example.goodjob.controllercompany;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.goodjob.dao.ICompanyInfoDetailDao;
import com.example.goodjob.dto.CompanyDetailDto94;
import com.example.goodjob.dto.CompanyDetailDto97;
import com.example.goodjob.service.CompanyService97;
import com.example.goodjob.util.FileUploadUtil;

@CrossOrigin("http://localhost:9991/")
@RestController
@RequestMapping("/api/company")
public class CompanyController_KKM {

	@Autowired
	private CompanyService97 comService;
	
	//(기업)내 정보 조회 get
	@GetMapping("/info")
	
	
	//(기업)내 정보 등록 post
	@PostMapping("/info")
	public ResponseEntity<String> write(@RequestParam("com_no") Long com_no,
	@RequestParam("img_url") MultipartFile imgFile, @RequestParam("introduction") String introduction,
	@RequestParam("pension") String pension,@RequestParam("sectors") String sectors,@RequestParam ("history") String history,@RequestParam("ideal_talent") String ideal_talent,
	@RequestParam("foundation") String foundation,@RequestParam("amount") int amount,@RequestParam("url")String url){
		
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	
	//파일 저장
	String imgFileName ="";
	
	try {
		if (imgFile != null && !imgFile.isEmpty()) {
			imgFileName = FileUploadUtil.saveFile(imgFile.getOriginalFilename(), imgFile);
		}
	}catch(IOException e){
		e.printStackTrace();
		return ResponseEntity.badRequest().body("파일 업로드 실패" + e.getMessage());
	}
	
	//Dto설정
	CompanyDetailDto97 companyDetailDto = new CompanyDetailDto97();
	companyDetailDto.setCom_no(com_no);
	companyDetailDto.setImg_url(imgFileName);
	companyDetailDto.setIntrodiction(introduction);
	companyDetailDto.setPension(pension);
	companyDetailDto.setSectors(sectors);
	companyDetailDto.setHistory(history);
	companyDetailDto.setIdeal_talent(ideal_talent);
	LocalDate foundationDate = LocalDate.parse(foundation, formatter);
	companyDetailDto.setFoundation(foundationDate);
	companyDetailDto.setAmount(amount);
	companyDetailDto.setUrl(url);
	
	comService.companyDetailWriteService(companyDetailDto);
	
	return ResponseEntity.ok("파일 업로드 실패");
		
	}
	
	//(기업)내 정보 수정 업데이트 put 
	//@PutMapping("/info")
	
}
