package com.example.goodjob.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface IComReplyDao_JYC {

	public int deleteByComCommunity_no(@Param("comCommunity_no") Long comCommunity_no);
}
