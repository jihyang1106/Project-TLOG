package com.tworaveler.tlog.member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Inject
	MemberDAO dao;

	@Override
	public List<MemberVO> FollowedUser() {
		return dao.FollowedUser();
	}

	@Override
	public List<String> selectmyTag(int userNum) {
		return dao.selectmyTag(userNum);
	}
	
}
