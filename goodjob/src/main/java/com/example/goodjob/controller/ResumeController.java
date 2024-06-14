package com.example.goodjob.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	private static final String UPLOAD_DIR = "/resource/img";
	
	@PostMapping("/write")
	public ResponseEntity<String> write(@RequestBody ResumeDto resumeDto,
			@RequestBody SkillDto skillDto,
			@RequestBody CareerDto careerDto,
			@RequestBody LicenseDto licenseDto,
			@RequestBody EducationDto educationDto,
			@RequestBody EtcDto etcDto,
			@RequestParam("imgFile") MultipartFile imgFile,
			@RequestParam("etc_name") MultipartFile etcFile) throws IOException {
		
		
		 // 파일 저장 처리
        String storedFileName = saveFile(imgFile);

        // ResumeDto에 이미지 파일 이름 설정
        resumeDto.setImg_url(storedFileName);

        // 각 DTO의 서비스 메소드 호출
        resumeService.resumeWriteService(resumeDto);
        careerService.careerWriteService(careerDto);
        educationService.educationWriteService(educationDto);
        skillService.skillWriteService(skillDto);
        licenseService.licenseWriteService(licenseDto);
        etcService.etcWriteService(etcDto);
		
		
		return ResponseEntity.ok("이력서 제출 성공");
	}
	
	// 파일 저장 메소드
    private String saveFile(MultipartFile file) throws IOException {
        if (file != null && !file.isEmpty()) {
            String originalFilename = file.getOriginalFilename();
            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
            String storedFileName = UUID.randomUUID().toString() + fileExtension;
            String filePath = UPLOAD_DIR + File.separator + storedFileName;

            File dest = new File(filePath);
            file.transferTo(dest);

            return storedFileName;
        }
        return null;
    }

}
