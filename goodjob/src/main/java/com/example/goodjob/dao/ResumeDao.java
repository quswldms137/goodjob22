package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.ResumeDto;

@Mapper
public interface ResumeDao {
	
	/* 이력서 등록 */
	public int resumeWrite(ResumeDto resumeDto);
	
	/* 로그인된 멤버의 이력서 가져오기 */
	public List<ResumeDto> getList(@Param("mem_no") Long mem_no);

}
