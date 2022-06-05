package com.tworaveler.tlog.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tworaveler.tlog.log.LogVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	BoardDAO dao;

	@Override
	public List<BoardVO> selectRecent(int startNum, int limitNum) {
		return dao.selectRecent(startNum, limitNum);
	}

}
