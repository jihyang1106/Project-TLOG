package com.tworaveler.tlog.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.tworaveler.tlog.log.LogVO;
import com.tworaveler.tlog.member.MemberVO;

public interface AdminService {

	// 여행일기 레코드 개수
	public int selectTlogTotalPosts(PagingVO pvo, LogVO vo);
	// 자유일기 레코드 개수
	public int selectBoardTotalPosts(PagingVO pvo, AdminVO vo);
	// 전체 회원 수
	public int selectTotalUser();
	// 전체 태그 개수
	public List<MemberVO> selectTag();
	// 여행일기 전체 게시판
	public List<LogVO> selectTlog(PagingVO pvo, LogVO vo); 
	// 자유일기 전체 게시판
	public List<AdminVO> selectBoard(PagingVO pvo, AdminVO vo);
}
