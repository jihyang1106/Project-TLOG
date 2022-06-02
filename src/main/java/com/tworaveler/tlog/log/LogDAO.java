package com.tworaveler.tlog.log;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.tworaveler.tlog.member.MemberVO;

@Mapper
@Repository
public interface LogDAO {
	// 메인: 최신 글 리스트
	public List<LogVO> selectLikeLog();

	// 메인: 팔로잉 글 리스트
	public List<LogVO> selectFollowLog(int userNum);

	// tNum의 태그 리스트
	public List<String> selectLogTag(int tNum);

	// tNum의 글내용 리스트
	public List<LogVO> selectLogDetail(int tNum);

	// tNum의 태그된 유저 리스트
	public List<LogVO> selectTagUsers(int tNum);

	// tNum의 태그 리스트
	public List<String> selectTagAll();

	// 메인) 팔로워 많은 유저
	public List<MemberVO> FollowedUser();

	// userNum의 태그 리스트
	public List<String> selectmyTag(int userNum);

	// 무한스크롤 리스트
	public List<LogVO> selectLogLists(int startNum, int limit);

	// 무한스크롤 검색 리스트 - 제목/작성자
	public List<LogVO> selectSearchLists(String searchKey, String string, int startNum, int limitNum);

	// 무한스크롤 검색 리스트 - 태그
	public List<LogVO> selectSearchListsTag(String string, int startNum, int limitNum);
}