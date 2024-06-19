
package com.example.goodjob.dao;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.goodjob.dto.EducationDto;

@Mapper
public interface IEducationDao_JYC {

	public int deleteByResume_no(@Param("resume_no") Long resume_no);
	public List<EducationDto> getEducation(@Param("resume_no") Long resume_no);
}
