package com.example.goodjob.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.goodjob.dao.ResumeDao;
import com.example.goodjob.dto.ResumeDto;

@Service
public class ResumeService {
	
	private static final String UPLOAD_DIR = "/resource/img";

	@Autowired
	private ResumeDao resumeDao;

	public ResumeDto resumeWriteService(@RequestBody ResumeDto resumeDto) throws IOException {

		 MultipartFile imgFile = resumeDto.getImgFile();

	        if (imgFile != null && !imgFile.isEmpty()) {
	            // 파일 저장 경로 설정
	            String originalFilename = imgFile.getOriginalFilename();
	            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
	            String storedFileName = UUID.randomUUID().toString() + fileExtension;
	            String filePath = UPLOAD_DIR + File.separator + storedFileName;

	            // 파일 저장
	            File dest = new File(filePath);
	            imgFile.transferTo(dest);

	            // DTO에 파일 경로 설정
	            resumeDto.setImg_url(storedFileName);
	        }

		resumeDao.resumeWrite(resumeDto);

		return resumeDto;

	}

}
