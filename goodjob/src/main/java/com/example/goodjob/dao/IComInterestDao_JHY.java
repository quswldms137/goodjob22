package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.ResumeDto;

@Mapper
public interface IComInterestDao_JHY {
	// 관심구직자 테이블에서 com_no(로그인된 기업회원으로) mem_no 조회 (값 들고오기)
	public List<Long> findMem_no(@Param("com_no") Long com_no);
	// 관심등록된 구직자들의 대표 이력서 조회
	public List<ResumeDto> findByMno(List<Long> mnoList);
	
}
