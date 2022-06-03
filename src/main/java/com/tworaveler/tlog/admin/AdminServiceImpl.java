package com.tworaveler.tlog.admin;

import javax.inject.Inject;

public class AdminServiceImpl implements AdminService {

	@Inject
	AdminDAO dao;
	
	@Override
	public int selectTotalPosts(PagingVO pvo, ReportVO vo) {
		return dao.selectTotalPosts(pvo, vo);
	}

}
