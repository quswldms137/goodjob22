package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.ServiceQuestionDto;

@Mapper
public interface IQnaDao99 {

	//문의 등록
	public int regQuestion(ServiceQuestionDto serviceQuestionDto);
	//username을 통해서 mem_no값 얻기
	public Long getMem_no(@Param("username") String username);
	//username을 통해서 com_no값 얻기
	public Long getCom_no(@Param("username") String username);
	//로그인한 회원 유형에 따른 문의 내역 리스트
	public List<ServiceQuestionDto> getMemQnaList(Long mem_no);
	public List<ServiceQuestionDto> getComQnaList(Long com_no);
	//상세 문의글
	public ServiceQuestionDto getQuestionDetail(Long cs_no);
	//문의글 수정
	public int modifyQuestion(ServiceQuestionDto serviceQuestionDto);
}
