package com.tworaveler.tlog.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface BoardDAO {
	
	// 글 내용 보이기
	public List<BoardVO> selectRecent(int startNum, int limitNum);
	// 글 작성하기
	public int boardInsert(BoardVO vo);
}
