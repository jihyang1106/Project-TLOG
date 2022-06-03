package com.tworaveler.tlog.admin;

import javax.inject.Inject;

public class AdminServiceImpl implements AdminService {

	@Inject
	AdminDAO dao;

	@Override
	public int selectTlogTotalPosts(PagingVO pvo, ReportVO vo) {
		return dao.selectTlogTotalPosts(pvo, vo);
	}

	@Override
	public int selectBoardTotalPosts(PagingVO pvo, ReportVO vo) {
		return dao.selectBoardTotalPosts(pvo, vo);
	}
	

}
