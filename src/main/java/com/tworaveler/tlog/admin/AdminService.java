package com.tworaveler.tlog.admin;

public interface AdminService {

	// 여행일기 레코드 개수
	public int selectTlogTotalPosts(PagingVO pvo, ReportVO vo);
	// 자유일기 레코드 개수
	public int selectBoardTotalPosts(PagingVO pvo, ReportVO vo);
}
