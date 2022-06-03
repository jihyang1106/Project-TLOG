package com.tworaveler.tlog.admin;

public interface AdminService {

	// 게시판 레코드 개수
	public int selectTotalPosts(PagingVO pvo, ReportVO vo);
}
