package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.ComInterestDto;
import com.example.goodjob.dto.ResumeDto;

@Mapper
public interface IComInterestDao_JHY {
	// 관심구직자 테이블에서 com_no(로그인된 기업회원으로) mem_no 전부 조회 (값 들고오기)
	public List<Long> findMem_no(@Param("com_no") Long com_no);
	// 관심등록된 구직자들의 대표 이력서 조회
	public List<ResumeDto> findByMno(List<Long> mnoList);
	// 관심 구직자 등록
	public void regInterestMember(@Param("com_no") Long com_no, @Param("mem_no") Long mem_no);
	// 등록되있는 관심 구직자 삭제
	public void deleteInterestMember(@Param("com_no") Long com_no, @Param("mem_no") Long mem_no);
	// 클릭을 누른 구직자가(mem_no 로) 관심 목록에 있는지 확인용(있으면 삭제메서드를, 없으면 등록 메서드를 실행)
	public int findByMem_noAndCom_no(@Param("com_no") Long com_no, @Param("mem_no") Long mem_no);
}
