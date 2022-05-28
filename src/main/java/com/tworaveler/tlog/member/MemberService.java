package com.tworaveler.tlog.member;

import java.util.List;

public interface MemberService {
	// 메인) 팔로워 많은 유저
	public List<MemberVO> FollowedUser();

	// userNum의 태그 리스트
	public List<String> selectmyTag(int userNum);
}
