package com.example.goodjob.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface IComCommunityDao_JYC {
	
	public List<Long> getComCommunity_no(@Param("com_no") Long com_no);
	public int deleteByComCommunity_no(@Param("comCommunity_no") Long comCommunity_no);

}
