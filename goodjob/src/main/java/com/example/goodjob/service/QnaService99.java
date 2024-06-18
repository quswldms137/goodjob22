package com.example.goodjob.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.goodjob.dao.IQnaDao99;
import com.example.goodjob.dto.ServiceQuestionDto;

@Service
public class QnaService99 {

	@Autowired
	private IQnaDao99 iQnaDao;
	
	public int regQuestion(ServiceQuestionDto serviceQuestionDto) {
		LocalDate today= LocalDate.now();
		serviceQuestionDto.setReg_date(today);
		int result = iQnaDao.regQuestion(serviceQuestionDto);
		return result;
	}
	
	public Long getMem_no(String username) {
		Long mem_no = iQnaDao.getMem_no(username);
		return mem_no;
	}
	
	public Long getCom_no(String username) {
		Long com_no = iQnaDao.getCom_no(username);
		return com_no;
	}
	
	public List<ServiceQuestionDto> getMemQnaList(Long mem_no){
		return iQnaDao.getMemQnaList(mem_no);
	}
	
	public List<ServiceQuestionDto> getComQnaList(Long com_no){
		return iQnaDao.getComQnaList(com_no);
	}
	
	public ServiceQuestionDto getQuestionDetail(Long cs_no) {
		return iQnaDao.getQuestionDetail(cs_no);
	}
	
	public int modifyQuestion(ServiceQuestionDto serviceQuestionDto) {
		int result = iQnaDao.modifyQuestion(serviceQuestionDto);
		return result;
	}
	
}
