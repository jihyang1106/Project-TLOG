package com.tworaveler.tlog.home;

import java.util.List;

import com.tworaveler.tlog.vo.LogVO;
import com.tworaveler.tlog.vo.MemberVO;

public interface HomeService {
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
}
