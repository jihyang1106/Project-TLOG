package com.tworaveler.tlog.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.tworaveler.tlog.log.LogVO;

@Repository
@Mapper
public interface AdminDAO {

	// 여행일기 레코드 개수
	public int selectTlogTotalPosts(PagingVO pvo, LogVO vo);
	// 자유일기 레코드 개수
	public int selectBoardTotalPosts(PagingVO pvo, AdminVO vo);
	// 전체 회원 수
	public int selectTotalUser();
	// 여행일기 전체 게시판
	public List<LogVO> selectTlog(PagingVO pvo, LogVO vo); 
	// 자유일기 전체 게시판
	public List<AdminVO> selectBoard(PagingVO pvo, AdminVO vo);
}
