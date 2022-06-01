package com.tworaveler.tlog.board;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	BoardDAO dao;

}
