package com.tworaveler.tlog.admin;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface AdminDAO {

	// 여행일기 레코드 개수
	public int selectTlogTotalPosts(PagingVO pvo, ReportVO vo);
	// 자유일기 레코드 개수
	public int selectBoardTotalPosts(PagingVO pvo, ReportVO vo);
	
}
