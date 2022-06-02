package com.tworaveler.tlog.member;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MemberDAO {
	public MemberVO infoMember (int userNum);
}