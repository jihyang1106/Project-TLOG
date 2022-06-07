package com.tworaveler.tlog.board;

import java.util.List;

import com.tworaveler.tlog.log.LogVO;

public interface BoardService {

	public List<BoardVO> selectRecent(int startNum, int limitNum);
	public int boardInsert(BoardVO vo);
}
