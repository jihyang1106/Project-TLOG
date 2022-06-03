package com.tworaveler.tlog.admin;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface AdminDAO {

	// 게시판 레코드 개수
	public int selectTotalPosts(PagingVO pvo, ReportVO vo);
}
