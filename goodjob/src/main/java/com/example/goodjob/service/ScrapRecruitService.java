package com.example.goodjob.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.goodjob.dao.ICompanyDao_JYC;
import com.example.goodjob.dao.IRecruitDao_JYC;
import com.example.goodjob.dao.IScrapRecruitDao;
import com.example.goodjob.dto.RecruitDto_JYC;
import com.example.goodjob.dto.ScrapRecruitDto;

@Service
public class ScrapRecruitService {

	private IScrapRecruitDao iScrapRecruitDao;
	private IRecruitDao_JYC iRecruitDao;
	private ICompanyDao_JYC iCompanyDao;
	
	public ScrapRecruitService(IScrapRecruitDao iScrapRecruitDao, IRecruitDao_JYC iRecruitDao, ICompanyDao_JYC iCompanyDao) {
		this.iScrapRecruitDao = iScrapRecruitDao;
		this.iRecruitDao = iRecruitDao;
		this.iCompanyDao = iCompanyDao;
	}
	
	public List<RecruitDto_JYC> getScrapList(Long mem_no, int page) {

		List<Long> list = iScrapRecruitDao.getRecruit_no(mem_no, (page - 1) * 5);
		List<Long> count = iScrapRecruitDao.findByMem_no(mem_no);
		List<RecruitDto_JYC> result = new ArrayList<>();

		if (list.size() > 0) {

			list.forEach(e -> {
				
				RecruitDto_JYC recruitDto = iRecruitDao.findByRecruit_no(e);

				String com_name = iCompanyDao.getCom_name(recruitDto.getCom_no());
				recruitDto.setCom_name(com_name);
				recruitDto.setTotal(count.size());
				result.add(recruitDto);
			});
		}

		return result;
	}
	
	public String scrap(ScrapRecruitDto scrapRecruitDto) {
		
		int count = iScrapRecruitDao.getScrap(scrapRecruitDto);
		
		if(count > 0) {
			int result = iScrapRecruitDao.removeScrap(scrapRecruitDto);
		
			if(result == 1) {
				return "공고 스크랩이 취소되었습니다.";
			} else {
				return "";
			}
		}else {
			int result = iScrapRecruitDao.createScrap(scrapRecruitDto);
			
			if(result == 1) {
				return "공고 스크랩이 등록되었습니다.";
			}else {
				return "";
			}
		}
		
	}
}
