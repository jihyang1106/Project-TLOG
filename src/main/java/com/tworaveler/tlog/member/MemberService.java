package com.tworaveler.tlog.member;

import java.util.List;

public interface MemberService {
<<<<<<< HEAD
	//해시태그
	public List<MemberVO> getAllHashtag();
=======
>>>>>>> 4dbbafcf3175ef2e7e661b5d4e95b97c3da405ef
	//팔로워 받아오기
	public List<MemberVO> setFollowerInfo(int userNum);
	//팔로우하는 사람 받아오기
	public List<MemberVO> setFollowInfo(int userNum);
<<<<<<< HEAD
	//로그인(회원정보 선택)
	public MemberVO selectMember(MemberVO vo);
=======
>>>>>>> 4dbbafcf3175ef2e7e661b5d4e95b97c3da405ef
}
