package com.example.goodjob.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.goodjob.dao.IMemberDao;
import com.example.goodjob.dao.IServiceQuestionDao;
import com.example.goodjob.dto.ServiceQuestionDto;

@Service
public class ServiceQuestionService {

	private IServiceQuestionDao iServiceQuestionDao;
	private IMemberDao iMemberDao; 
	
	public ServiceQuestionService(IServiceQuestionDao iServiceQuestionDao, IMemberDao iMemberDao) {
		this.iServiceQuestionDao = iServiceQuestionDao;
		this.iMemberDao = iMemberDao;
	}
	
	public List<ServiceQuestionDto> getQnaList(String username){
		
		
		Long mem_no = iMemberDao.getMem_no(username);
		
		List<ServiceQuestionDto> result = iServiceQuestionDao.findByMem_no(mem_no);
		
		result.forEach(item -> {
			if(item.getAnswer() == null) {
				item.setAnswer("미답변");
			}else {
				item.setAnswer("답변완료");
			}
		});
		
		return result;
	}
	
	public int deleteQna(Long cs_no) {
		
		int result = iServiceQuestionDao.deleteQna(cs_no);
		
		return result;
	}
}
