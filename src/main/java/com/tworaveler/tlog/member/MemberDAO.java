package com.tworaveler.tlog.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MemberDAO {
	//회원가입
	public int insertMember(MemberVO vo);
	//로그인(회원정보 선택)
	public MemberVO selectMember(int userNum);
	//로그인(회원정보 선택_카카오)
	public MemberVO selectMemberByKakao(String idKakao);
	//회원정보 수정
	public void updateMember(MemberVO vo);
	//회원탈퇴
	public int userDel(int userNum, int loginStatus);
	//모든 해시태그 정보 받아오기
	public List<MemberVO> getAllHashtag();
	//mytag 추가
	public int mytagInsert(int tagNum, int userNum);
	//mytag 삭제
	public int mytagDel(int userNum);
	//my 정보 받아오기
	public List<MemberVO> getMytag(int userNum);
	//팔로우 하기
	public void setFollow(int userNum, int loginNum);
	//언팔로우
	public void unfollow(int userNum, int loginNum);
	//팔로우 여부 판단
	public int isFollowed(int userNum, int loginUserNum);
	//팔로워 받아오기
	public List<MemberVO> setFollowerInfo(int userNum);
	//팔로우하는 사람 받아오기
	public List<MemberVO> setFollowInfo(int userNum);
}