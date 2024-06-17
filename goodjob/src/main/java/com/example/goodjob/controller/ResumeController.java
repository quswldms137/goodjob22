package com.example.goodjob.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.goodjob.dto.CareerDto;
import com.example.goodjob.dto.EducationDto;
import com.example.goodjob.dto.EtcDto;
import com.example.goodjob.dto.LicenseDto;
import com.example.goodjob.dto.ResumeDto;
import com.example.goodjob.dto.SkillDto;
import com.example.goodjob.service.CareerService;
import com.example.goodjob.service.EducationService;
import com.example.goodjob.service.EtcService;
import com.example.goodjob.service.LicenseService;
import com.example.goodjob.service.ResumeService;
import com.example.goodjob.service.SkillService;
import com.example.goodjob.util.FileUploadUtil;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/resume")
public class ResumeController {

	@Autowired
	private ResumeService resumeService;

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

	@PostMapping("/write")
	public ResponseEntity<String> write(@RequestParam("mem_no") Long mem_no,
			@RequestParam("img_url") MultipartFile imgFile, @RequestParam("title") String title,
			@RequestParam("hope_job") String hope_job, @RequestParam("hope_city") String hope_city,
			@RequestParam("hope_pay") String hope_pay, @RequestParam("military") String military,
			@RequestParam("port_url") String port_url, @RequestParam("growth") String growth,
			@RequestParam("motive") String motive, @RequestParam("personality") String personality,
			@RequestParam("company") String company, @RequestParam("car_join_date") String car_join_date,
			@RequestParam("quit_date") String quit_date, @RequestParam("main_part") String main_part,
			@RequestPart(value = "etc_name1", required = false) MultipartFile etcFile1,
			@RequestPart(value = "etc_name2", required = false) MultipartFile etcFile2,
			@RequestPart(value = "etc_name3", required = false) MultipartFile etcFile3,
			@RequestParam("license_name") String license_name, @RequestParam("agency") String agency,
			@RequestParam("get_date") String get_date, @RequestParam("sk_name") String sk_name,
			@RequestParam("school") String school, @RequestParam("edu_join_date") String edu_join_date,
			@RequestParam("edu_gra_date") String edu_gra_date, @RequestParam("graduation") String graduation,
			@RequestParam("grades") String grades, @RequestParam("major") String major,
			@RequestParam("username") String username, @RequestParam("mem_birth") String mem_birth,
			@RequestParam("mem_gender") String mem_gender, @RequestParam("mem_email") String mem_email,
			@RequestParam("mem_tel") String mem_tel) {

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		// 파일 저장 로직
		String imgFileName = "";
		String etcFileName1 = "";
		String etcFileName2 = "";
		String etcFileName3 = "";

		try {
			if (imgFile != null && !imgFile.isEmpty()) {
	            imgFileName = FileUploadUtil.saveFile(imgFile.getOriginalFilename(), imgFile);
	        }

	        if (etcFile1 != null && !etcFile1.isEmpty()) {
	            etcFileName1 = FileUploadUtil.saveFile(etcFile1.getOriginalFilename(), etcFile1);
	        }

	        if (etcFile2 != null && !etcFile2.isEmpty()) {
	            etcFileName2 = FileUploadUtil.saveFile(etcFile2.getOriginalFilename(), etcFile2);
	        }

	        if (etcFile3 != null && !etcFile3.isEmpty()) {
	            etcFileName3 = FileUploadUtil.saveFile(etcFile3.getOriginalFilename(), etcFile3);
	        }
		    

		} catch (IOException e) {
		    e.printStackTrace();
		    return ResponseEntity.badRequest().body("파일 업로드 실패" + e.getMessage());
		}

		// ResumeDto 설정
		ResumeDto resumeDto = new ResumeDto();
		resumeDto.setMem_no(mem_no);
		resumeDto.setTitle(title);
		resumeDto.setImg_url(imgFileName);
		resumeDto.setHope_job(hope_job);
		resumeDto.setHope_city(hope_city);
		resumeDto.setHope_pay(hope_pay);
		resumeDto.setMilitary(military);
		resumeDto.setPort_url(port_url);
		resumeDto.setGrowth(growth);
		resumeDto.setMotive(motive);
		resumeDto.setPersonality(personality);

		resumeDto = resumeService.resumeWriteService(resumeDto);

		Long resumeNo = resumeDto.getResume_no();

		// LicenseDto 설정
		LicenseDto licenseDto = new LicenseDto();
		licenseDto.setResume_no(resumeNo);
		licenseDto.setLicense_name(license_name);
		licenseDto.setAgency(agency);
		LocalDate parsedGetDate = LocalDate.parse(get_date, formatter);
		licenseDto.setGet_date(parsedGetDate);

		// SkillDto 설정
		SkillDto skillDto = new SkillDto();
		skillDto.setResume_no(resumeNo);
		skillDto.setSk_name(sk_name);

		// EducationDto 설정
		EducationDto educationDto = new EducationDto();
		educationDto.setResume_no(resumeNo);
		educationDto.setSchool(school);
		LocalDate parsedEduJoinDate = LocalDate.parse(edu_join_date, formatter);
		educationDto.setEdu_join_date(parsedEduJoinDate);
		LocalDate parsedEduGraDate = LocalDate.parse(edu_gra_date, formatter);
		educationDto.setEdu_gra_date(parsedEduGraDate);
		educationDto.setGraduation(graduation);
		educationDto.setGrades(grades);
		educationDto.setMajor(major);

		// CareerDto 설정
		CareerDto careerDto = new CareerDto();
		careerDto.setResume_no(resumeNo);
		careerDto.setCompany(company);
		LocalDate parsedCarJoinDate = LocalDate.parse(car_join_date, formatter);
		careerDto.setCar_join_date(parsedCarJoinDate);
		LocalDate parsedQuitDate = LocalDate.parse(quit_date, formatter);
		careerDto.setQuit_date(parsedQuitDate);
		careerDto.setMain_part(main_part);

		// EtcDto 설정
		EtcDto etcDto = new EtcDto();
		etcDto.setResume_no(resumeNo);
		etcDto.setEtc_name1(etcFileName1);
		etcDto.setEtc_name2(etcFileName2);
		etcDto.setEtc_name3(etcFileName3);

		licenseService.licenseWriteService(licenseDto);
		skillService.skillWriteService(skillDto);
		educationService.educationWriteService(educationDto);
		careerService.careerWriteService(careerDto);
		etcService.etcWriteService(etcDto);

		return ResponseEntity.ok("파일 업로드 실패");
	}

	/* 로그인된 멤버 이력서 리스트 */
	@GetMapping("/list")
	public List<ResumeDto> resumeList(@RequestParam("mem_no") Long mem_no) {

		return resumeService.resumeGetService(mem_no);
	}
	
	/* 이력서 상세보기 */
	@GetMapping("/detail")
	public ResumeDto getResumeDetail(@RequestParam("resume_no") Long resume_no) {
		
		return resumeService.getResumeDetailService(resume_no);
	}
	
	
	
	
	
	
	

}
