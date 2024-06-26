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
import com.example.goodjob.dao.ICompanyDetailDao_JYC;
import com.example.goodjob.dao.IMemberDao;
import com.example.goodjob.dao.IResumeDao_JHY;
import com.example.goodjob.dto.ComInterestDto;
import com.example.goodjob.dto.CompanyDto_JYC;
import com.example.goodjob.dto.RecruitDto;
import com.example.goodjob.dto.ResumeAndSkillDto;
import com.example.goodjob.dto.ResumeDto;
import com.example.goodjob.service.QnaService99;

@CrossOrigin("*")
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
	
	@Autowired
	private QnaService99 qnaService;
	
	@Autowired
	private ICompanyDetailDao_JYC companyDetailDao;
	
	
	// 기업 메인페이지 내가 쓴 채용공고 목록 조회 (로그인 연동전이라 모든 목록 불러오게 설정해둠) - 로그인 연동 완료(자기가 쓴 채용공고 목록만 보임)
	@GetMapping("/index")
	public List<RecruitDto> main(@RequestParam("username") String username) {
		Long com_no = qnaService.getCom_no(username);
		CompanyDto_JYC com_detail_no_ = companyDetailDao.findByCom_no(com_no);
		List<RecruitDto> list = companyDao.findRecruitList(com_no);
		System.out.println(com_no);
		System.out.println(list);
		Long com_detail_no = com_detail_no_.getCom_detail_no();
		
		return list;
	}
	// 비회원이 기업 메인 페이지 접속시 휑한거 같아서 모든 채용공고 보여주기로 함.
	@GetMapping("/index2")
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
		
		List<RecruitDto> recruit = companyDao.findLatest(recruitDto.getCom_no());
		System.out.println(recruit);
		
		Long recruit_no = recruit.get(0).getRecruit_no();
		System.out.println(recruit_no);
		
		List<String> skill = recruitDto.getSkill();
		System.out.println(skill);
		
		for(int i = 0; i < skill.size(); i++) {
			String sk_name = skill.get(i);
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
		companyDao.deleteC_skill(recruit_no);
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
		Long recruit_no = recruit.getRecruit_no();
		companyDao.deleteC_skill(recruit_no); // recruit_no 채용공고에 등록된 스킬 리셋(삭제)
		for(int i = 0; i < recruit.getSkill().size(); i++) {
			String sk_name = recruit.getSkill().get(i);
			companyDao.regSkill(sk_name, recruit_no);
		}
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
	public List<ResumeAndSkillDto> interestMemberList(@RequestParam("username") String username) {
		Long com_no = qnaService.getCom_no(username);
		List<Long> list = comInterestDao.findMem_no(com_no); // mem_no List (com_no)로 mem_no 받기
		List<ResumeAndSkillDto> resumeList = new ArrayList<>();
		
		System.out.println("------------------");
		System.out.println(list);
		
		for(int i = 0; i < list.size(); i++) {
			ResumeAndSkillDto resume = resumeDao.findByMem_no(list.get(i)); // mem_no 값을 넣고 매퍼에서 mem_no 랑 대표이력서 여부 main = 1 인 이력서 받아오기
			System.out.println(resume);
			System.out.println("--------------");
			
			String mem_name = memberDao.findMem_nameWithMem_no(list.get(i)); // mem_no 값으로 mem_name 받아오기
			resume.setMem_name(mem_name); // 받아온 mem_name 을 resume 에 저장
			List<String> sk_name = resumeDao.findSk_nameWithResume_no(resume.getResume_no()); // resume_no 로 skill 테이블에서 sk_name 을 조회
			
			resume.setCom_no(companyDao.findByUsername(username)); // username 으로 com_no 를 받아와서 변수에 넣기
			resume.setSk_name(sk_name); // 받아온 sk_name 을 resume 에 저장
			resumeList.add(resume); // resumeList 에 resume 를 저장 -> 반복
		}
		
		return resumeList;
	}
	
	@GetMapping("/employWrite")
	public String username(@RequestParam("username") String username) {
		
		Long com_no = qnaService.getCom_no(username);
		
		return "" + com_no;
	}
	
	@PutMapping("/interestMember")
	public String interestMember(@RequestBody ComInterestDto comInterestDto) {
		int count = comInterestDao.findByMem_noAndCom_no(comInterestDto.getCom_no(), comInterestDto.getMem_no());
		String str = "";
		if(count == 0) {
			comInterestDao.regInterestMember(comInterestDto.getCom_no(), comInterestDto.getMem_no());
			str = "관심 구직자로 등록되었습니다.";
		}else {
			comInterestDao.deleteInterestMember(comInterestDto.getCom_no(), comInterestDto.getMem_no());
			str = "관심 구직자에서 해제되었습니다.";
		}
		
		return str;
	}
	
	@GetMapping("/recommendedMemberRecruitInfo")
	public List<RecruitDto> recommendedMemberRecruitInfo(@RequestParam("username") String username) {
		
		Long com_no = companyDao.findByUsername(username);
		List<RecruitDto> list = companyDao.findByCom_no(com_no); // com_no 로 채용공고(recruit) 조회
		List<Long> com_noList = new ArrayList<>();
		for(int i = 0; i < list.size(); i++) {
			List<String> sk_nameList = companyDao.findSkillListByRecruit_no(list.get(i).getRecruit_no()); // recruit_no 로 채용공고 요구스킬(c_skill) 조회
			list.get(i).setSkill(sk_nameList);
		}
		System.out.println(list);
		
		return list;
	}
	
	@GetMapping("/recommendedMemberResumeInfo")
	public List<ResumeDto> recommendedMemberResumeInfo() {
		
		List<ResumeDto> mainResumeList = resumeDao.findMainResume();
		for(int i = 0; i < mainResumeList.size(); i++) {
			List<String> sk_nameList = companyDao.findByResume_no(mainResumeList.get(i).getResume_no());
			mainResumeList.get(i).setSkill(sk_nameList);
		}
		
		return mainResumeList;
	}
	
	
}
