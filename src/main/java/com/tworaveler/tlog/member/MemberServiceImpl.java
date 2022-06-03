package com.tworaveler.tlog.member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Inject
	MemberDAO dao;

	@Override
<<<<<<< HEAD
	public List<MemberVO> getAllHashtag() {
		return dao.getAllHashtag();
	}

	@Override
=======
>>>>>>> 4dbbafcf3175ef2e7e661b5d4e95b97c3da405ef
	public List<MemberVO> setFollowerInfo(int userNum) {
		return dao.setFollowerInfo(userNum);
	}

	@Override
	public List<MemberVO> setFollowInfo(int userNum) {
		return dao.setFollowInfo(userNum);
	}
<<<<<<< HEAD

	@Override
	public MemberVO selectMember(MemberVO vo) {
		return dao.selectMember(vo);
	}
=======
>>>>>>> 4dbbafcf3175ef2e7e661b5d4e95b97c3da405ef
	
}
