package com.tworaveler.tlog.admin;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tworaveler.tlog.log.LogVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	AdminDAO dao;

	@Override
	public int selectTlogTotalPosts(PagingVO pvo, LogVO vo) {
		return dao.selectTlogTotalPosts(pvo, vo);
	}

	@Override
	public int selectBoardTotalPosts(PagingVO pvo, AdminVO vo) {
		return dao.selectBoardTotalPosts(pvo, vo);
	}
	
	@Override
	public int selectTotalUser() {
		return dao.selectTotalUser();
	}
	
	@Override
	public List<Map<String, Object>> selectTag() {
		return dao.selectTag();
	}

	@Override
	public List<LogVO> selectTlog(PagingVO pvo, LogVO vo) {
		return dao.selectTlog(pvo, vo);
	}

	@Override
	public List<AdminVO> selectBoard(PagingVO pvo, AdminVO vo) {
		return dao.selectBoard(pvo, vo);
	}




	

}
