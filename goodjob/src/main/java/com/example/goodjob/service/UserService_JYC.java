package com.example.goodjob.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.example.goodjob.dao.IUserDao;
import com.example.goodjob.dto.UserDto;

@Service
public class UserService_JYC {

	private IUserDao iUserDao;
	
	public UserService_JYC(IUserDao iUserDao) {
		this.iUserDao = iUserDao;
	}
	
	public Map<List<String>, List<Long>> getMonthlyUser() {
		
		List<UserDto> userDtoList = iUserDao.getUserList();
		
		Long january = 0L;
		Long februrary = 0L;
		Long march = 0L;
		Long april = 0L;
		Long may = 0L;
		Long june = 0L;
		Long july = 0L;
		Long august = 0L;
		Long september = 0L;
		Long october = 0L;
		Long november = 0L;
		Long december = 0L;
		
		for(int i = 0; i < userDtoList.size(); i++) {
			String date = userDtoList.get(i).getReg_date().toString();
			
			String[] strList = date.split("-");
			
			switch (strList[1]) {  
	            case "01" : january++;
	                     break;
	            case "02" : februrary++;
	                     break;
	            case "03" : march++;
	                     break;
	            case "04" : april++;
	                     break;
	            case "05" : may++;
	                     break;
	            case "06" : june++;
	                     break;
	            case "07" : july++;
	                     break;
	            case "08" : august++;
	                     break;
	            case "09" : september++;
	                     break;
	            case "10" : october++;
	                     break;
	            case "11" : november++;
	                     break;
	            case "12" : december++;
	                     break;
			}
		}
		
		Map<List<String>, List<Long>> map = new HashMap<>();
		
		List<String> monthNames = new ArrayList<>();
		List<Long> amounts = new ArrayList<>();
		
		monthNames.add("january");
		amounts.add(january);
		monthNames.add("februrary");
		amounts.add(februrary);
		monthNames.add("march");
		amounts.add(march);
		monthNames.add("april");
		amounts.add(april);
		monthNames.add("may");
		amounts.add(may);
		monthNames.add("june");
		amounts.add(june);
		monthNames.add("july");
		amounts.add(july);
		monthNames.add("august");
		amounts.add(august);
		monthNames.add("september");
		amounts.add(september);
		monthNames.add("october");
		amounts.add(october);
		monthNames.add("november");
		amounts.add(november);
		monthNames.add("december");
		amounts.add(december);
		
		map.put(monthNames, amounts);
		
		return map;
	}
}
