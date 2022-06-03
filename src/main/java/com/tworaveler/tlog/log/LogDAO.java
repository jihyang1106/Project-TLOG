package com.tworaveler.tlog.log;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.tworaveler.tlog.member.MemberVO;

@Mapper
@Repository
public interface LogDAO {
	// tNum의 태그 리스트
	public List<LogVO> selectLogTag(int tNum);

	// tNum의 글내용 리스트
	public List<LogVO> selectLogDetail(int tNum);

	// tNum의 태그된 유저 리스트
	public List<LogVO> selectTagUsers(int tNum);

	// tNum의 태그 리스트
	public List<LogVO> selectTagAll();

	// userNum의 태그 리스트
	public List<LogVO> selectMyTag(int userNum);

	/* =============== home ===================== */
	// 팔로워 많은 유저
	public List<MemberVO> FollowedUser();

	// 최신 글 리스트
	public List<LogVO> selectLikeLog();

	// 팔로잉 글 리스트
	public List<LogVO> selectFollowLog(int userNum);

	/* =============== logShare ===================== */
	// 무한스크롤 리스트(최신순)
	public List<LogVO> selectNewLogs(int startNum, int limit);

	// 무한스크롤 리스트(좋아요순)
	public List<LogVO> selectLikeLogs(int startNum, int limit);

	// 무한스크롤 검색 리스트(최신순) - 제목/작성자
	public List<LogVO> searchNewLogs(String searchKey, String string, int startNum, int limitNum);

	// 무한스크롤 검색 리스트(최신순) - 태그
	public List<LogVO> searchNewLogsTag(String string, int startNum, int limitNum);

	// 무한스크롤 검색 리스트(좋아요순) - 제목/작성자
	public List<LogVO> searchLikeLogs(String searchKey, String string, int startNum, int limitNum);

	// 무한스크롤 검색 리스트(좋아요순) - 태그
	public List<LogVO> searchLikeLogsTag(String string, int startNum, int limitNum);

	/* =============== 프로필 ===================== */
	public List<LogVO> selectMyLogs(int userNum, int isWriter, int startNum, int limitNum);
	public List<LogVO> selectTaggedLogs(int userNum, int isWriter, int startNum, int limitNum);
	public List<LogVO> selectLikedLogs(int userNum, int isWriter, int startNum, int limitNum);
	// 날짜 검색
	public List<LogVO> searchMyLogs(int userNum, int isWriter, String searchStart, String searchEnd, int startNum, int limitNum);
	public List<LogVO> searchTaggedLogs(int userNum, int isWriter, String searchStart, String searchEnd, int startNum, int limitNum);
	public List<LogVO> searchLikedLogs(int userNum, int isWriter, String searchStart, String searchEnd, int startNum, int limitNum);
	
	/* =============== 글쓰기 ===================== */
	public int logWriteOk(LogVO vo);
	
}