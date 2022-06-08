package com.tworaveler.tlog.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tworaveler.tlog.board.BoardVO;
import com.tworaveler.tlog.log.LogVO;
import com.tworaveler.tlog.member.MemberVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	AdminDAO dao;

	@Override
	public int selectTlogTotalPosts(PagingVO pvo, LogVO vo) {
		return dao.selectTlogTotalPosts(pvo, vo);
	}

	@Override
	public int selectBoardTotalPosts(PagingVO pvo, BoardVO vo) {
		return dao.selectBoardTotalPosts(pvo, vo);
	}
	
	@Override
	public int selectTotalUser(PagingVO pvo, MemberVO vo) {
		return dao.selectTotalUser(pvo, vo);
	}
	
	@Override
	public List<MemberVO> selectTag() {
		return dao.selectTag();
	}

	@Override
	public List<LogVO> selectTlog(PagingVO pvo, LogVO vo) {
		return dao.selectTlog(pvo, vo);
	}

	@Override
	public List<BoardVO> selectBoard(PagingVO pvo, BoardVO vo) {
		return dao.selectBoard(pvo, vo);
	}

	@Override
	public List<MemberVO> selectMemberList(PagingVO pvo, MemberVO vo) {
		return dao.selectMemberList(pvo, vo);
	}

	@Override
	public int selectMemberAdmin(int userNum) {
		return dao.selectMemberAdmin(userNum);
	}

	@Override
	public int updateAdmin(int userNum, int status) {
		return dao.updateAdmin(userNum, status);
	}
}
