package com.tworaveler.tlog.board;

import java.util.List;

import com.tworaveler.tlog.log.LogVO;

public interface BoardService {

	// 글 리스트
	public List<BoardVO> selectRecent(int startNum, int limitNum);
	
	// 글 작성하기
	public int boardInsert(BoardVO vo);
	
	//글 삭제하기
	public int deleteBoard(int boardNum);
}
