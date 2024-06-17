package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.RecruitDto;
import com.example.goodjob.dto.SkillDto;

@Mapper
public interface ICompanyDao_JHY {
	// 채용공고 전체 조회 (로그인기능 완료되면 연동해서 자기가 쓴 채용공고만 나오게 쿼리문 수정요망
	public List<RecruitDto> findAll();
	// 채용공고 등록 메서드
	public boolean recruitWrite(@Param("recruit") RecruitDto recruitDto);
	// 내가 쓴 채용공고 목록 필요한 항목만 추리고, 마감일 계산해서 나온 값 조회
	public List<RecruitDto> findByCom_no();
	// 내가 쓴 채용공고 삭제
	public boolean delete(@Param("recruit_no") Long recruit_no);
	// 채용공고 스킬 등록
	public boolean regSkill(@Param("skill") String skill, @Param("recruit_no") Long recruit_no);
	// 채용공고 최신등록
	public List<RecruitDto> findLatest(@Param("com_no") Long com_no);
	// 특정 채용공고 정보 조회
	public RecruitDto findByRecruit_no(@Param("recruit_no") Long recruit_no);
	
	
	
}
