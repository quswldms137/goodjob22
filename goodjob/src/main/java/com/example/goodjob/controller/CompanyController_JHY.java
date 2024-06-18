package com.example.goodjob.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.goodjob.dao.IComInterestDao_JHY;
import com.example.goodjob.dao.ICompanyDao_JHY;
import com.example.goodjob.dao.IMemberDao;
import com.example.goodjob.dao.IResumeDao_JHY;
import com.example.goodjob.dto.RecruitDto;
import com.example.goodjob.dto.ResumeDto;

@CrossOrigin("http://localhost:9991/")
@RestController
@RequestMapping("/api/company")
public class CompanyController_JHY {
	
	@Autowired
	private ICompanyDao_JHY companyDao;
	
	@Autowired
	private IComInterestDao_JHY comInterestDao;
	
	@Autowired
	private IResumeDao_JHY resumeDao;
	
	@Autowired
	private IMemberDao memberDao;
	
	// 기업 메인페이지 내가 쓴 채용공고 목록 조회 (로그인 연동전이라 모든 목록 불러오게 설정해둠)
	@GetMapping("/index")
	public List<RecruitDto> main() {
		
		List<RecruitDto> list = companyDao.findAll();
		System.out.println(list);
		return list;
	}
	// 채용공고 작성
	@PostMapping("/employWrite")//, SkillDto skillDto
	public String employWrite(@RequestBody RecruitDto recruitDto) {
		boolean tf = companyDao.recruitWrite(recruitDto);
		System.out.println(recruitDto);
		
		List<RecruitDto> recruit = companyDao.findLatest(1L);
		System.out.println(recruit);
		
		Long recruit_no = recruit.get(0).getRecruit_no();
		System.out.println(recruit_no);
		
		List<String> skill = recruitDto.getSkill();
		System.out.println(skill);
		
		for(String sk_name : skill) {
			companyDao.regSkill(sk_name, recruit_no);
		}
		if(tf == true ) {
			return "채용공고 등록에 성공했습니다.";
		}else {
			return "채용공고 등록에 실패했습니다.";
		}
		
	}
	// 채용공고 수정페이지로 이동시 정보 조회해서 값 받아오는 용도
	@GetMapping("/employUpdate")
	public RecruitDto employUpdate(@RequestParam("recruit_no") Long recruit_no) {
		
		RecruitDto recruit = companyDao.findByRecruit_no(recruit_no);
		List<String> list = companyDao.findSkillListByRecruit_no(recruit_no);
		recruit.setSkill(list);
		
		System.out.println("==========================");
		System.out.println("list : " + list);
		System.out.println("recruit : " + recruit);
		return recruit;
	}
	// 채용공고 삭제
	@DeleteMapping("/deleteRecruit")
	public String deleteRecruit(@RequestParam("recruit_no") Long recruit_no) {
		
		boolean tf = companyDao.delete(recruit_no);
		String str = "";
		if(tf == true) {
			str = "삭제 성공";
		}else {
			str = "삭제 실패";
		}
		
		return str;
	}
	// 채용공고 수정
	@PutMapping("/recruitUpdate")
	public String recruitUpdate(@RequestBody RecruitDto recruit) {
		boolean tf = companyDao.updateRecruit(recruit);
		String str = "";
		if(tf == true) {
			str = "채용공고 수정에 성공하였습니다.";
		}else {
			str = "채용공고 수정에 실패하셨습니다. 다시 시도해주세요.";
		}
		return str;
	}
	// 관심 구직자 목록 조회 (로그인 미연동이기 때문에 임이의 com_no 값 넣고 테스트)
	@GetMapping("/interestMemberList")
	public List<ResumeDto> interestMemberList() {
		
		List<Long> list = comInterestDao.findMem_no(1L); // mem_no List (com_no)로 mem_no 받기
		List<ResumeDto> resumeList = new ArrayList<>();
		for(int i = 0; i < list.size(); i++) {
			ResumeDto resume = resumeDao.findByMem_no(list.get(i)); // mem_no 값을 넣고 매퍼에서 mem_no 랑 대표이력서 여부 main = 1 인 이력서 받아오기
			String mem_name = memberDao.findByMem_no(list.get(i)); // mem_no 값으로 mem_name 받아오기
			resume.setMem_name(mem_name); // 받아온 mem_name 을 resume 에 저장
			resumeList.add(resume); // resumeList 에 resume 를 저장 -> 반복
		}
		return resumeList;
	}
	
	
	
}
