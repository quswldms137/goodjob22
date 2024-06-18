package com.example.goodjob.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dto.ServiceQuestionDto;
import com.example.goodjob.service.ServiceQuestionService;

@CrossOrigin("http://localhost:9991")
@RestController
@RequestMapping("/api/qna")
public class QnaController {

	private ServiceQuestionService serviceQuestionService;
	
	public QnaController(ServiceQuestionService serviceQuestionService) {
		this.serviceQuestionService = serviceQuestionService;
	}
	
	@GetMapping("/{page}/{username}")
	public ResponseEntity<List<ServiceQuestionDto>> getQna(@PathVariable("username") String username, @PathVariable("page") int page) {
		
		List<ServiceQuestionDto> result = serviceQuestionService.getQnaList(username, page);
		
		if(!result.isEmpty()) {
			return ResponseEntity.status(HttpStatus.OK)
					.body(result);
		}
		
		return ResponseEntity.status(HttpStatus.NOT_FOUND)
				.body(result);
	}
	
	@DeleteMapping("/{cs_no}")
	public ResponseEntity<String> deleteQna(@PathVariable("cs_no") Long cs_no) {
		
		int result = serviceQuestionService.deleteQna(cs_no);
		
		if(result > 0) {
			return ResponseEntity.status(HttpStatus.OK)
					.body("문의내역이 성공적으로 삭제되었습니다.");
		}
		
		return ResponseEntity.status(HttpStatus.BAD_REQUEST)
				.body("문의내역 삭제가 실패했습니다.");
	}
	
	@GetMapping("/noanswer/list/{page}")
	public ResponseEntity<List<ServiceQuestionDto>> getNoAnswerList(@PathVariable("page") int page){
		
		List<ServiceQuestionDto> serviceQuestionDtoList = serviceQuestionService.getNoAnswerList(page);
		
		if(serviceQuestionDtoList == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST)
					.body(null);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(serviceQuestionDtoList);
	}
	
	@GetMapping("/noanswer/detail/{cs_no}")
	public ResponseEntity<ServiceQuestionDto> getServiceQuestionDto(@PathVariable("cs_no") Long cs_no){
		
		ServiceQuestionDto serviceQuestionDto = serviceQuestionService.getServiceQuestion(cs_no);
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(serviceQuestionDto);
	}
	
	@PostMapping("/answer")
	public ResponseEntity<String> registAnswer(@RequestBody ServiceQuestionDto serviceQuestionDto){

		String result = serviceQuestionService.registAnswer(serviceQuestionDto.getCs_no(), serviceQuestionDto.getAnswer());
		
		if(!result.equals("답변이 성공적으로 등록되었습니다.")) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST)
					.body(null);
		}
		
		return ResponseEntity.status(HttpStatus.OK)
				.body(result);
	}
}
