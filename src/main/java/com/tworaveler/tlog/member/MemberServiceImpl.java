package com.tworaveler.tlog.member;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Inject
	MemberDAO dao;

	@Override
	public MemberVO infoMember(int userNum) {
		return dao.infoMember(userNum);
	}

}
