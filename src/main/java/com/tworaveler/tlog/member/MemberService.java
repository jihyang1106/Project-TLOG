package com.tworaveler.tlog.member;

import java.util.List;

public interface MemberService {
	//팔로워 받아오기
	public List<MemberVO> setFollowerInfo(int userNum);
	//팔로우하는 사람 받아오기
	public List<MemberVO> setFollowInfo(int userNum);
}
