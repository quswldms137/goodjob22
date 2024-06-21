package com.example.goodjob.controllercompany;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.goodjob.dao.ICompany97;
import com.example.goodjob.dao.IRecruitListDao94;
import com.example.goodjob.dto.CareerDto;
import com.example.goodjob.dto.CompanyDetailDto97;
import com.example.goodjob.dto.EducationDto;
import com.example.goodjob.dto.EtcDto;
import com.example.goodjob.dto.LicenseDto;
import com.example.goodjob.dto.MemRecruitDto;
import com.example.goodjob.dto.MemRecruitJoinDto;
import com.example.goodjob.dto.MemberDto;
import com.example.goodjob.dto.RecruitDto;
import com.example.goodjob.dto.ResumeDetailCompanyDto_KKM;
import com.example.goodjob.dto.ResumeDetailDto;
import com.example.goodjob.dto.ResumeDto;
import com.example.goodjob.dto.SkillDto;
import com.example.goodjob.service.CareerService;
import com.example.goodjob.service.CompanyService97;
import com.example.goodjob.service.EducationService;
import com.example.goodjob.service.EtcService;
import com.example.goodjob.service.LicenseService;
import com.example.goodjob.service.MemberService93;
import com.example.goodjob.service.QnaService99;
import com.example.goodjob.service.ResumeService;
import com.example.goodjob.service.ResumeService_JYC;
import com.example.goodjob.service.ResumeService_KKM;
import com.example.goodjob.service.SkillService;
import com.example.goodjob.util.FileUploadUtil;

@CrossOrigin("http://localhost:9991/")
@RestController
@RequestMapping("/api/company")
public class CompanyController_KKM {

	@Autowired
	private CompanyService97 comService;
	@Autowired
	private QnaService99 qnaService;
	@Autowired
	private ICompany97 icompany;
	
	//이력서 관련
	@Autowired
	private CareerService careerService;
	@Autowired
	private EducationService educationService;
	@Autowired
	private SkillService skillService;
	@Autowired
	private LicenseService licenseService;
	@Autowired
	private EtcService etcService;
	@Autowired
	private MemberService93 memberService;
	@Autowired
	private ResumeService_KKM resumeService;
	

	// (기업)내 정보 조회 get
	@GetMapping("/infofind")
	public CompanyDetailDto97 companyinfo(@RequestParam("username") String username) {

		System.out.println("username : " + username);
		Long com_no = qnaService.getCom_no(username);
		
		System.out.println("조회에서 com_no받아오는지" + com_no);
		return icompany.getcompanyinfo(com_no);
	}

	//Detail이 있는지 확인하기
	@GetMapping("/info/detail/{username}")
	public String findInfo(@PathVariable("username")String username) {
		
		Long com_no = qnaService.getCom_no(username);
		CompanyDetailDto97 result = icompany.getkeyvalue(com_no);
		System.out.println("result:" + result);
		System.out.println("컴앤오 :" + com_no);
		System.out.println("유저네임 :" + username);
		if(result == null) {
			return "등록된 기업정보가 없습니다 등록페이지로 이동합니다!!"; 
		}else {
			return "이미 기업정보가 존재합니다 수정페이지로 이동합니다!!";
		}
		
		 
	}
	
	//Detail이 있는지 확인하기
		@GetMapping("/infomodi/detail/{username}")
		public String findInfoModify(@PathVariable("username")String username) {
			
			Long com_no = qnaService.getCom_no(username);
			CompanyDetailDto97 result = icompany.getkeyvalue(com_no);
			System.out.println("result:" + result);
			System.out.println("컴앤오 :" + com_no);
			System.out.println("유저네임 :" + username);
			if(result != null) {
				return "이미 기업정보가 존재합니다 수정페이지로 이동합니다!!"; 
			}else {
				return "등록된 기업정보가 없습니다 등록페이지로 이동합니다!!";
			}
			
			 
		}
	
	
	// (기업)내 정보 등록 post
	@PostMapping("/info")
	public ResponseEntity<String> write(
			@RequestParam("img_url") MultipartFile imgFile, @RequestParam("introduction") String introduction,
			@RequestParam("pension") String pension, @RequestParam("sectors") String sectors,
			@RequestParam("history") String history, @RequestParam("ideal_talent") String ideal_talent,
			@RequestParam("foundation") String foundation, @RequestParam("amount") int amount,
			@RequestParam("url") String url, @RequestHeader("username") String username){

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		Long com_no = qnaService.getCom_no(username);
		System.out.println(com_no);
		
		// 파일 저장
		String imgFileName = "";

		try {
			if (imgFile != null && !imgFile.isEmpty()) {
				imgFileName = FileUploadUtil.saveFile(imgFile.getOriginalFilename(), imgFile);
			}
		} catch (IOException e) {
			e.printStackTrace();
			return ResponseEntity.badRequest().body("파일 업로드 실패" + e.getMessage());
		}

		// Dto설정
		CompanyDetailDto97 companyDetailDto = new CompanyDetailDto97();
		companyDetailDto.setCom_no(com_no);
		companyDetailDto.setImg_url(imgFileName);
		companyDetailDto.setIntroduction(introduction);
		companyDetailDto.setPension(pension);
		companyDetailDto.setSectors(sectors);
		companyDetailDto.setHistory(history);
		companyDetailDto.setIdeal_talent(ideal_talent);
		LocalDate foundationDate = LocalDate.parse(foundation, formatter);
		companyDetailDto.setFoundation(foundationDate);
		companyDetailDto.setAmount(amount);
		companyDetailDto.setUrl(url);

		comService.companyDetailWriteService(companyDetailDto);

		return ResponseEntity.ok("파일 업로드 성공");

	}

	// (기업)내 정보 수정 업데이트 put
	 @PutMapping("/info")
	 public ResponseEntity<String> update(
		        @RequestParam("img_url") MultipartFile imgFile, @RequestParam("introduction") String introduction,
		        @RequestParam("pension") String pension, @RequestParam("sectors") String sectors,
		        @RequestParam("history") String history, @RequestParam("ideal_talent") String ideal_talent,
		        @RequestParam("location") String location,
		        @RequestParam("foundation") String foundation, @RequestParam("amount") int amount,
		        @RequestParam("url") String url, @RequestHeader("username") String username){

		    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		    Long com_no = qnaService.getCom_no(username);
		    System.out.println(com_no);

		    // 파일 저장
		    String imgFileName = "";

		    try {
		        if (imgFile != null && !imgFile.isEmpty()) {
		            imgFileName = FileUploadUtil.saveFile(imgFile.getOriginalFilename(), imgFile);
		        }
		    } catch (IOException e) {
		        e.printStackTrace();
		        return ResponseEntity.badRequest().body("파일 업로드 실패" + e.getMessage());
		    }

		    // Dto설정
		    CompanyDetailDto97 companyDetailDto = new CompanyDetailDto97();
		    companyDetailDto.setCom_no(com_no);
		    companyDetailDto.setImg_url(imgFileName);
		    companyDetailDto.setIntroduction(introduction);
		    companyDetailDto.setPension(pension);
		    companyDetailDto.setSectors(sectors);
		    companyDetailDto.setHistory(history);
		    companyDetailDto.setIdeal_talent(ideal_talent);
		    LocalDate foundationDate = LocalDate.parse(foundation, formatter);
		    companyDetailDto.setFoundation(foundationDate);
		    companyDetailDto.setLocation(location);
		    companyDetailDto.setAmount(amount);
		    companyDetailDto.setUrl(url);

		    // 기존 데이터 업데이트
		    comService.updateCompanyDetail(companyDetailDto);

		    return ResponseEntity.ok("기업 정보 업데이트 성공");
		}
	 
	 //지원받은 이력서 목록페이지(조회만 하면된다)
	 /*
	 @GetMapping("/receiveResume/{com_no}")
	 public ResponseEntity<List<MemRecruitJoinDto>> getreceiveResume(@PathVariable("com_no") Long com_no) {
		 
		 List<MemRecruitJoinDto> resumeList = comService.getReceiveResumeList(com_no);
		 
		 if(resumeList == null) {
			 return ResponseEntity.status(HttpStatus.BAD_REQUEST)
					 .body(null);
		 }
		 
		 return ResponseEntity.status(HttpStatus.OK)
				 .body(resumeList);
	 }
	*/
	 @GetMapping("/receiveResume")
	 public ResponseEntity<List<MemRecruitJoinDto>> getreceiveResume(@RequestParam("username") String username) {
		 Long com_no = qnaService.getCom_no(username);
		 List<MemRecruitJoinDto> resumeList = comService.getReceiveResumeList(com_no);
		 
		 if(resumeList == null) {
			 return ResponseEntity.status(HttpStatus.BAD_REQUEST)
					 .body(null);
		 }
		 
		 return ResponseEntity.status(HttpStatus.OK)
				 .body(resumeList);
	 }
	 
	 //지원자 및 관심 구직자 이력서 상세보기 페이지
	 @GetMapping("/resumeDetail/{resume_no}")
		public ResumeDetailCompanyDto_KKM getResumeDetail(@PathVariable("resume_no") Long resume_no) {
			
		 ResumeDetailCompanyDto_KKM resumeDetailDto = resumeService.getResumeDetail(resume_no);
		 
		 System.out.println("result : " + resumeDetailDto);
		 
		 if(resumeDetailDto == null) {
			 return null;
		 }
		 
		 return resumeDetailDto;
	 }
	 //지원자 및 관심 구직자 합격 불합격
	 @PutMapping("passfail")
	 public ResponseEntity<String> passfail(){
		 
		 return null;
	 }
	 
	 
	 
	 
	 
	 
}
