package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.RecruitDto;

@Mapper
public interface ICompanyDao_JHY {
	// 채용공고 전체 조회 (로그인기능 완료되면 연동해서 자기가 쓴 채용공고만 나오게 쿼리문 수정요망
	public List<RecruitDto> findAll();
	
	// 로그인시 저장되는 com_no 로 채용공고 조회
	public List<RecruitDto> findRecruitList(@Param("com_no") Long com_no);
	
	// 채용공고 등록 메서드
	public boolean recruitWrite(@Param("recruit") RecruitDto recruitDto);
	
	// 채용공고 스킬 등록
	public boolean regSkill(@Param("skill") String skill, @Param("recruit_no") Long recruit_no);
	
	// 채용공고 수정시 등록된 스킬 리셋 후 다시 저장 (삭제용)
	public void deleteC_skill(@Param("recruit_no") Long recruit_no);
	
	// 내가 쓴 채용공고 목록 필요한 항목만 추리고, 마감일 계산해서 나온 값 조회
	public List<RecruitDto> findMyRecruit();
	
	// 내가 쓴 채용공고 삭제
	public boolean delete(@Param("recruit_no") Long recruit_no);
	
	// 채용공고 최신등록
	public List<RecruitDto> findLatest(@Param("com_no") Long com_no);
	
	// 채용공고 번호로 특정 채용공고 정보 조회
	public RecruitDto findByRecruit_no(@Param("recruit_no") Long recruit_no);
	
	// 채용공고에서 요구하는 스킬 조회
	public List<String> findSkillListByRecruit_no(@Param("recruit_no") Long recruit_no);
	
	// 채용공고 수정
	public boolean updateRecruit(@Param("recruit") RecruitDto recruit);
	
	// username 으로 com_no 를 받아오기
	public Long findByUsername(@Param("username") String username);
	
	// com_no 로 내가 쓴 채용공고 목록 받아오기
	public List<RecruitDto> findByCom_no(@Param("com_no") Long com_no);
	
	// resume_no(이력서 번호) 로 skill 조회 해서 sk_name 받아오기
	public List<String> findByResume_no(@Param("resume_no") Long resume_no);
}
