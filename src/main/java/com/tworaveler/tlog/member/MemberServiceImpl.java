package com.tworaveler.tlog.member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Inject
	MemberDAO dao;

	@Override
	public List<MemberVO> getAllHashtag() {
		return dao.getAllHashtag();
	}
	@Override
	public List<MemberVO> setFollowerInfo(int userNum) {
		return dao.setFollowerInfo(userNum);
	}
	@Override
	public List<MemberVO> setFollowInfo(int userNum) {
		return dao.setFollowInfo(userNum);
	}
	@Override
	public MemberVO selectMember(MemberVO vo) {
		return dao.selectMember(vo);
	}
}