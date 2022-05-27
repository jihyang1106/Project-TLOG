package com.tworaveler.tlog.log;

import java.util.List;

public interface LogService {
	//메인: 최신 글 리스트
	public List<LogVO> selectLikeLog();
	//tNum의 태그 리스트
	public List<String> selectLogTag(int tNum);
	//tNum의 글내용 리스트
	public List<LogVO> selectLogDetail(int tNum);
}
