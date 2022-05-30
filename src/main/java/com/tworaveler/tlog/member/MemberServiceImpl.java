package com.tworaveler.tlog.member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tworaveler.tlog.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	@Inject
	MemberDAO dao;

}
