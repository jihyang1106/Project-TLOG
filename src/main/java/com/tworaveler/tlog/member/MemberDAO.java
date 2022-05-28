package com.tworaveler.tlog.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MemberDAO {
	//메인) 팔로워 많은 유저
	public List<MemberVO> FollowedUser();

	// userNum의 태그 리스트
	public List<String> selectmyTag(int userNum);
}