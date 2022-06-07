package com.tworaveler.tlog.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	BoardDAO dao;

	@Override
	public List<BoardVO> selectRecent(int startNum, int limitNum) {
		return dao.selectRecent(startNum, limitNum);
	}

	@Override
	public int boardInsert(BoardVO vo) {
		return dao.boardInsert(vo);
	}

	@Override
	public int deleteBoard(int boardNum) {
		return dao.deleteBoard(boardNum);
	}

}
