package com.tworaveler.tlog.member;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.tworaveler.tlog.vo.MemberVO;

@Mapper
@Repository
public interface MemberDAO {
	public MemberVO infoMember (int userNum);
}