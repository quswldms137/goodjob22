package com.example.goodjob.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.goodjob.dao.ICompanyDao_JYC;
import com.example.goodjob.dao.IRecruitDao_JYC;
import com.example.goodjob.dto.RecruitDto_JYC;

@Service
public class RecruitService_JYC {

	private IRecruitDao_JYC iRecruitDao;
	private ICompanyDao_JYC iCompanyDao;

	public RecruitService_JYC(IRecruitDao_JYC iRecruitDao, ICompanyDao_JYC iCompanyDao) {
		this.iRecruitDao = iRecruitDao;
		this.iCompanyDao = iCompanyDao;
	}

	public List<RecruitDto_JYC> getVip() {

		List<Long> com_noList = iCompanyDao.getCom_noOrderByVip();

		List<RecruitDto_JYC> vipList = new ArrayList<>();

		com_noList.forEach(com_no -> {
			vipList.add(iRecruitDao.findVipByCom_no(com_no));
		});

		vipList.forEach(vip -> {
			if(vip != null) {
				
			vip.setCom_name(iCompanyDao.getCom_name(vip.getCom_no()));
			}
		});
		
		return vipList;

	}

	public List<RecruitDto_JYC> getAll() {

		List<RecruitDto_JYC> result = iRecruitDao.findAllOrderByReg_dateDesc();

		result.forEach(item -> {
			item.setCom_name(iCompanyDao.getCom_name(item.getCom_no()));
		});

		return result;
	}
}
