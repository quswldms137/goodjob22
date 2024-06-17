package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.EtcDto;

@Mapper
public interface EtcDao {
	
	public int etcWrite(EtcDto etcDto);
	
	/* 이력서 디테일에 들어가는 기타첨부자료 정보 */
	public EtcDto getEtcDetail(@Param("resume_no") Long resume_no);

}
