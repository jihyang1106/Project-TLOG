package com.tworaveler.tlog.admin;

import java.util.List;

import com.tworaveler.tlog.board.BoardVO;
import com.tworaveler.tlog.log.LogVO;
import com.tworaveler.tlog.member.MemberVO;

public interface AdminService {

	// 여행일기 레코드 개수
	public int selectTlogTotalPosts(PagingVO pvo, LogVO vo);
	// 자유일기 레코드 개수
	public int selectBoardTotalPosts(PagingVO pvo, BoardVO vo);
	// 전체 회원 수
	public int selectTotalUser(PagingVO pvo, MemberVO vo);
	// 전체 태그 개수
	public List<MemberVO> selectTag();
	// 여행일기 전체 게시판
	public List<LogVO> selectTlog(PagingVO pvo, LogVO vo); 
	// 자유일기 전체 게시판
	public List<BoardVO> selectBoard(PagingVO pvo, BoardVO vo);
	// 전체 회원 리스트
	public List<MemberVO> selectMemberList(PagingVO pvo, MemberVO vo);
	// 관리자 회원 여부
	public int selectMemberAdmin(int userNum);
	// 관리자 권한 부여
	public int updateAdmin(int userNum, int status);
}
