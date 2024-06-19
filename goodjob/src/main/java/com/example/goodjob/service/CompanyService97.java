package com.example.goodjob.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.ICompany97;
import com.example.goodjob.dto.CompanyDetailDto97;
import com.example.goodjob.dto.MemRecruitDto;
import com.example.goodjob.dto.MemRecruitJoinDto;
import com.example.goodjob.dto.RecruitDto;
import com.example.goodjob.dto.ResumeDto;

@Service
public class CompanyService97 {

	@Autowired
	private ICompany97 icompany97;
	
	public int companyDetailWriteService(CompanyDetailDto97 companydetail) {
		
		return icompany97.CompanyDetailWrite(companydetail);
	}
	
	public int updateCompanyDetail(CompanyDetailDto97 companydetail) {
		
		return icompany97.updateCompanyDetail(companydetail);
	}
	
	public List<MemRecruitJoinDto> getReceiveResumeList(Long com_no){
		
		List<RecruitDto> recruitDtoList = icompany97.getRecruitList(com_no);
		
		List<MemRecruitJoinDto> result = new ArrayList<>();
		
		recruitDtoList.forEach(recruitDto -> {
			List<MemRecruitDto> memRecruitDtoList = icompany97.getMemRecruitList(recruitDto.getRecruit_no());
			
			memRecruitDtoList.forEach(memRecruitDto -> {
				ResumeDto resumeDto = icompany97.getResumeDto(memRecruitDto.getResume_no());
				String mem_name = icompany97.getMem_name(resumeDto.getMem_no());
				
				MemRecruitJoinDto dto = new MemRecruitJoinDto();
				dto.setRectitle(recruitDto.getTitle());
				dto.setMem_name(mem_name);
				dto.setHope_city(resumeDto.getHope_city());
				dto.setHope_job(resumeDto.getHope_job());
				dto.setTitle(resumeDto.getTitle());
				dto.setCom_no(com_no);
				dto.setResume_no(resumeDto.getResume_no());
				
				result.add(dto);
			});
			
		});
		
		return result;
	}
	
}
