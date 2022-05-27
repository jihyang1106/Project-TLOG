package com.tworaveler.tlog.log;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface LogDAO {
	//메인: 최신 글 리스트
	public List<LogVO> selectLikeLog();
	//tNum의 태그 리스트
	public List<String> selectLogTag(int tNum);
	//tNum의 글내용 리스트
	public List<LogVO> selectLogDetail(int tNum);
}