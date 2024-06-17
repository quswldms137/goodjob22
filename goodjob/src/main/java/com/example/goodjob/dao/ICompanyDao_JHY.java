package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.RecruitDto;

@Mapper
public interface ICompanyDao_JHY {
	// 채용공고 전체 조회 (로그인기능 완료되면 연동해서 자기가 쓴 채용공고만 나오게 쿼리문 수정요망
	public List<RecruitDto> findAll();
	// 채용공고 등록 메서드
	public boolean recruitWrite(@Param("recruit") RecruitDto recruitDto);
	// 내가 쓴 채용공고 목록 필요한 항목만 추리고, 마감일 계산해서 나온 값 조회
	public List<RecruitDto> findByCom_no();
	
	
	
	
	
	
}
