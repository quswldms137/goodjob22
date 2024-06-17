package com.example.goodjob.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.goodjob.dao.ICompanyDao_JYC;
import com.example.goodjob.dao.ICompanyDetailDao_JYC;
import com.example.goodjob.dao.IMemInterestDao;
import com.example.goodjob.dto.CompanyDto_JYC;
import com.example.goodjob.dto.MemInterestDto;
import com.example.goodjob.dto.ScrapRecruitDto;

@Service
public class MemInterestService {

	private IMemInterestDao iMemInterestDao;
	private ICompanyDao_JYC iCompanyDao;
	private ICompanyDetailDao_JYC iCompanyDetailDao;

	public MemInterestService(IMemInterestDao iMemInterestDao, ICompanyDao_JYC iCompanyDao,
			ICompanyDetailDao_JYC iCompanyDetailDao) {
		this.iMemInterestDao = iMemInterestDao;
		this.iCompanyDao = iCompanyDao;
		this.iCompanyDetailDao = iCompanyDetailDao;
	}

	public List<CompanyDto_JYC> getSubscribeList(Long mem_no, int page) {

		System.out.println("start : " + (page - 1) * 5);
		System.out.println("end : " + page * 5);
		
		List<Long> list = iMemInterestDao.getCom_no(mem_no, (page - 1) * 5);
		List<Long> count = iMemInterestDao.findByMem_no(mem_no);
		
		List<CompanyDto_JYC> result = new ArrayList<>();

		if (list.size() > 0) {

			list.forEach(e -> {
				CompanyDto_JYC companyDto = iCompanyDao.findByCom_no(e);
				CompanyDto_JYC companyDetailDto = iCompanyDetailDao.findByCom_no(e);

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
				companyDto.setTotal(count.size());
				result.add(companyDto);
			});
		}
		
		return result;
	}
	
	public String subscribe(MemInterestDto memInterestDto) {
		
		int count = iMemInterestDao.getSubscribe(memInterestDto);
		
		if(count > 0) {
			int result = iMemInterestDao.removeSubscribe(memInterestDto);
		
			if(result == 1) {
				return "관심 기업이 취소되었습니다.";
			} else {
				return "";
			}
		}else {
			int result = iMemInterestDao.createSubscribe(memInterestDto);
			
			if(result == 1) {
				return "관심 기업이 등록되었습니다.";
			}else {
				return "";
			}
		}
	}
}
