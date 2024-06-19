package com.example.goodjob.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.goodjob.dao.ICompanyDao_JYC;
import com.example.goodjob.dao.IMemberDao;
import com.example.goodjob.dao.IServiceQuestionDao;
import com.example.goodjob.dto.ServiceQuestionDto;

@Service
public class ServiceQuestionService {

	private IServiceQuestionDao iServiceQuestionDao;
	private IMemberDao iMemberDao; 
	private ICompanyDao_JYC iCompanyDao;
	
	public ServiceQuestionService(IServiceQuestionDao iServiceQuestionDao, IMemberDao iMemberDao, ICompanyDao_JYC iCompanyDao) {
		this.iServiceQuestionDao = iServiceQuestionDao;
		this.iMemberDao = iMemberDao;
		this.iCompanyDao = iCompanyDao;
	}
	
	public List<ServiceQuestionDto> getQnaList(String username, int page){
		
		
		Long mem_no = iMemberDao.getMem_no(username);
		
		List<ServiceQuestionDto> result = iServiceQuestionDao.findByMem_noPage(mem_no, (page - 1) * 5);
		List<ServiceQuestionDto> total = iServiceQuestionDao.findByMem_no(mem_no);
		
		result.get(0).setTotal(total.size());
		
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
	
	public List<ServiceQuestionDto> getNoAnswerList(int page) {

		int noAnswerCount = iServiceQuestionDao.countNoAnswer();
		int yesAnswerCount = iServiceQuestionDao.countYesAnswer();

		List<ServiceQuestionDto> serviceQuestionDtoList = iServiceQuestionDao.getNoAnswerDtoList((page - 1) * 5);
		
		serviceQuestionDtoList.get(0).setNoAnswerTotal(noAnswerCount);
		serviceQuestionDtoList.get(0).setYesAnswerTotal(yesAnswerCount);
		return serviceQuestionDtoList;
	}
	

	public List<ServiceQuestionDto> getAnswerList(int page) {

		int yesAnswerCount = iServiceQuestionDao.countYesAnswer();
		int noAnswerCount = iServiceQuestionDao.countNoAnswer();
		
		List<ServiceQuestionDto> serviceQuestionDtoList = iServiceQuestionDao.getYesAnswerDtoList((page - 1) * 5);
		
		serviceQuestionDtoList.get(0).setYesAnswerTotal(yesAnswerCount);
		serviceQuestionDtoList.get(0).setNoAnswerTotal(noAnswerCount);
		return serviceQuestionDtoList;
	}
	
	public ServiceQuestionDto getServiceQuestion(Long cs_no) {
		
		ServiceQuestionDto serviceQuestionDto = iServiceQuestionDao.findByCs_no(cs_no);
		
		if(serviceQuestionDto.getMem_no() != null) {
			serviceQuestionDto.setUsername(iMemberDao.findByMem_no(serviceQuestionDto.getMem_no()).getUsername());
		}else{
			serviceQuestionDto.setUsername(iCompanyDao.findByCom_no(serviceQuestionDto.getCom_no()).getUsername());
		}
		
		return serviceQuestionDto;
	}
	
	public String registAnswer(Long cs_no, String answer) {
		
		int result = iServiceQuestionDao.writeAnswer(cs_no, answer);
		
		if(result > 0) {
			return "답변이 성공적으로 등록되었습니다.";
		}
		
		return "";
	}
	
	public String updateAnswer(Long cs_no, String answer) {
		
		int result = iServiceQuestionDao.writeAnswer(cs_no, answer);
		
		if(result > 0) {
			return "답변이 성공적으로 수정되었습니다.";
		}
		
		return "";
	}
}
