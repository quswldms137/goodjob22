package com.example.goodjob.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.example.goodjob.dao.ICSkillDao_JYC;
import com.example.goodjob.dao.IComCommunityDao_JYC;
import com.example.goodjob.dao.IComInterestDao_JYC;
import com.example.goodjob.dao.IComReplyDao_JYC;
import com.example.goodjob.dao.ICompanyDao_JYC;
import com.example.goodjob.dao.ICompanyDetailDao_JYC;
import com.example.goodjob.dao.IMemInterestDao;
import com.example.goodjob.dao.IMemRecruitDao_JYC;
import com.example.goodjob.dao.IRecruitDao_JYC;
import com.example.goodjob.dao.IScrapRecruitDao;
import com.example.goodjob.dao.IUserDao;
import com.example.goodjob.dto.CompanyDto;
import com.example.goodjob.dto.CompanyDto_JYC;

@Service
public class CompanyService_JYC {

	private ICompanyDao_JYC iCompanyDao;
	private ICompanyDetailDao_JYC iCompanyDetailDao;
	private IRecruitDao_JYC iRecruitDao;
	private ICSkillDao_JYC iCSkillDao;
	private IMemRecruitDao_JYC iMemRecruitDao;
	private IScrapRecruitDao iScrapRecruitDao;
	private IComCommunityDao_JYC iComCommunityDao;
	private IComReplyDao_JYC iComReplyDao;
	private IComInterestDao_JYC iComInterestDao;
	private IMemInterestDao iMemInterestDao;
	private IUserDao iUserDao;
	
	public CompanyService_JYC(ICompanyDao_JYC iCompanyDao, ICompanyDetailDao_JYC iCompanyDetailDao, IRecruitDao_JYC iRecruitDao, ICSkillDao_JYC iCSkillDao
			, IMemRecruitDao_JYC iMemRecruitDao, IScrapRecruitDao iScrapRecruitDao, IComCommunityDao_JYC iComCommunityDao, IComReplyDao_JYC iComReplyDao
			, IMemInterestDao iMemInterestDao, IUserDao iUserDao) {
		this.iCompanyDao = iCompanyDao;
		this.iCompanyDetailDao = iCompanyDetailDao;
		this.iRecruitDao = iRecruitDao;
		this.iCSkillDao = iCSkillDao;
		this.iMemRecruitDao = iMemRecruitDao;
		this.iScrapRecruitDao = iScrapRecruitDao;
		this.iComCommunityDao = iComCommunityDao;
		this.iComReplyDao = iComReplyDao;
		this.iMemInterestDao = iMemInterestDao;
		this.iUserDao = iUserDao;
	}
	
	public List<CompanyDto_JYC> getCompanyList(int page){
		
		List<CompanyDto_JYC> companyList = iCompanyDao.getCompanyDtoList((page - 1) * 5);
		int count = iCompanyDao.count();
		companyList.get(0).setTotal(count);
		
		return companyList;
	}
	
	public CompanyDto_JYC getCompanyDto(Long com_no) {
		
		CompanyDto_JYC companyDto = iCompanyDao.findByCom_no(com_no);
		CompanyDto_JYC companyDetailDto = iCompanyDetailDao.findByCom_no(com_no);
		
		if(companyDetailDto != null) {
			
		companyDto.setCom_detail_no(companyDetailDto.getCom_detail_no());
		companyDto.setIntrodiction(companyDetailDto.getIntrodiction());
		companyDto.setImg_url(companyDetailDto.getImg_url());
		companyDto.setPension(companyDetailDto.getPension());
		companyDto.setCompensation(companyDetailDto.getCompensation());
		companyDto.setFacilities(companyDetailDto.getFacilities());
		companyDto.setPolicy(companyDetailDto.getPolicy());
		companyDto.setConvenience(companyDetailDto.getConvenience());
		companyDto.setSectors(companyDetailDto.getSectors());
		companyDto.setHistory(companyDetailDto.getHistory());
		companyDto.setIdeal_talent(companyDetailDto.getIdeal_talent());
		companyDto.setFoundation(companyDetailDto.getFoundation());
		companyDto.setAmount(companyDetailDto.getAmount());
		companyDto.setUrl(companyDetailDto.getUrl());
		}

		return companyDto;
	}
	
	public String deleteInformation(Long com_no, String username) {
		
		List<Long> recruit_noList = iRecruitDao.getRecruit_no(com_no);
		
		recruit_noList.forEach(recruit_no -> {
			iCSkillDao.deleteByRecruit_no(recruit_no);
			iMemRecruitDao.deleteByRecruit_no(recruit_no);
			iScrapRecruitDao.deleteByRecruit_no(recruit_no);
			iRecruitDao.deleteByRecruit_no(recruit_no);
		});
		
		List<Long> comCommunity_noList = iComCommunityDao.getComCommunity_no(com_no);
		comCommunity_noList.forEach(comCommunity_no -> {
			iComReplyDao.deleteByComCommunity_no(comCommunity_no);
			iComCommunityDao.deleteByComCommunity_no(comCommunity_no);
		});
		
		iComInterestDao.deleteByCom_no(com_no);
		iMemInterestDao.deleteByCom_no(com_no);
		iCompanyDetailDao.deleteByCom_no(com_no);
		iCompanyDao.deleteByUsername(username);
		int result = iUserDao.deleteUser(username);
		
		if(result > 0) {
			return "회원 삭제 성공.";
		}
		
		
		return "회원 삭제 실패.";
	}
	
	public Map<List<String>, List<Long>> getCompanyMoney() {
		
		List<CompanyDto_JYC> companyDtoList =  iCompanyDao.getCompanyMoney();
		
		Map<List<String>, List<Long>> map = new HashMap<>();
		
		List<String> companyNames = new ArrayList<>();
		List<Long> money = new ArrayList<>();
		
		for(int i = 0; i < 4; i++) {
			companyNames.add(companyDtoList.get(i).getCom_name());
			money.add(companyDtoList.get(i).getMoney());
		}
		
		Long totalMoney = 0L;
		
		for(int i = 4; i < companyDtoList.size(); i++) {
			totalMoney += companyDtoList.get(i).getMoney();
		}
		
		money.add(totalMoney);
		companyNames.add("기타");
		
		map.put(companyNames, money);
		return map;
	}
}
