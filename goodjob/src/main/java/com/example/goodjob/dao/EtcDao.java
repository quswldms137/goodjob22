package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.goodjob.dto.EtcDto;

@Mapper
public interface EtcDao {
	
	public EtcDto etcWrite(EtcDto etcDto);

}
