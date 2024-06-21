package com.example.goodjob.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dto.ServiceQuestionDto;
import com.example.goodjob.service.QnaService99;

import jakarta.servlet.http.HttpServletRequest;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/qna-99")
public class QnAController_99 {

	@Autowired
	private QnaService99 qnaService;
	
	@PostMapping("/insert")
	public ResponseEntity<String> regQuestion(@RequestBody ServiceQuestionDto serviceQuestionDto,
			@RequestHeader("username")String username, @RequestHeader("role")String role, HttpServletRequest request) {
		System.out.println("문의글 작성 컨트롤러,,,,");
		
		System.out.println(serviceQuestionDto);
		
		System.out.println("username: " + username);
		System.out.println("role: " + role);
		
		Long mem_no = qnaService.getMem_no(username);
		Long com_no = qnaService.getCom_no(username);

		String content = serviceQuestionDto.getContent();
		content = content.replace("\n", "<br>");
		if(mem_no != null) {
			System.out.println("mem_no: " + mem_no);
			serviceQuestionDto.setMem_no(mem_no);
		} else if(com_no != null){
			System.out.println("com_no: " + com_no);
			serviceQuestionDto.setCom_no(com_no);
		}
		
		int result = qnaService.regQuestion(serviceQuestionDto);
		
		if(result == 1) {
			return ResponseEntity.ok("문의가 접수되었습니다.");
		}
		
		return ResponseEntity.badRequest().body("다시 입력해주세요.");
	}
	
	@GetMapping("/detail")
	public ServiceQuestionDto getQuestionDetail(@RequestParam("cs_no") Long cs_no){
		System.out.println("실행중....");
		ServiceQuestionDto detail = qnaService.getQuestionDetail(cs_no);
		System.out.println("answer: " + detail.getAnswer());
		return detail;
	}
	
	@GetMapping("/list")
	public ResponseEntity<List<ServiceQuestionDto>> getQnaList(@RequestHeader("username")String username, @RequestHeader("role")String role ){
		System.out.println("실행중,,,,,,,,,");
		Long mem_no = qnaService.getMem_no(username);
		Long com_no = qnaService.getCom_no(username);
		
		System.out.println("username: " + username);
		System.out.println("role: " + role);
		
		System.out.println("mem_no" + mem_no + ", com_no: " + com_no);
		if(mem_no != null) {
			System.out.println("mem_no: " + mem_no);
			return ResponseEntity.ok(qnaService.getMemQnaList(mem_no));
		} else if(com_no != null){
			System.out.println("com_no: " + com_no);
			return ResponseEntity.ok(qnaService.getComQnaList(com_no));
		} else {
			return ResponseEntity.notFound().build();
		}
	}
	
	@PutMapping("/modify")
	public ResponseEntity<String> modifyQuestion(@RequestBody ServiceQuestionDto serviceQuestionDto,
			@RequestHeader("username")String username) {
		System.out.println("문의글 수정 컨트롤러,,,");
		
		System.out.println("수정된 내용: " + serviceQuestionDto);
		
		System.out.println("username: " + username);
		
		Long mem_no = qnaService.getMem_no(username);
		Long com_no = qnaService.getCom_no(username);

		if(mem_no != null) {
			System.out.println("mem_no: " + mem_no);
			serviceQuestionDto.setMem_no(mem_no);
		} else if(com_no != null){
			System.out.println("com_no: " + com_no);
			serviceQuestionDto.setCom_no(com_no);
		}
		
		int result = qnaService.modifyQuestion(serviceQuestionDto);
		
		if(result == 1) {
			return ResponseEntity.ok("수정이 완료되었습니다!");
		} else {
			return ResponseEntity.badRequest().body("다시 시도해주세요.");
		}
	}
	
	@DeleteMapping
	public ResponseEntity<String> deleteQuestion(@RequestParam("cs_no") Long cs_no){
		int result = qnaService.deleteQuestion(cs_no);
		
		if(result == 1) {
			return ResponseEntity.ok("성공적으로 삭제되었습니다.");
		} else {
			return ResponseEntity.badRequest().body("다시 시도해주세요.");
		}
		
	}
	
	
	
}
