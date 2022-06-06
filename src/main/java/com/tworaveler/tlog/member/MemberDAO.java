package com.tworaveler.tlog.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Mapper
@Repository
public interface MemberDAO {
	
	//해시태그
	public List<MemberVO> getAllHashtag();
	//팔로워 받아오기
	public List<MemberVO> setFollowerInfo(int userNum);
	//팔로우하는 사람 받아오기
	public List<MemberVO> setFollowInfo(int userNum);
	//로그인(회원정보 선택)
	public MemberVO selectMember(MemberVO vo);
}