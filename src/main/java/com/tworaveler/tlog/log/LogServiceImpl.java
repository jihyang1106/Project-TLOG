package com.tworaveler.tlog.log;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class LogServiceImpl implements LogService{
	@Inject
	LogDAO dao;

	@Override
	public List<LogVO> selectLikeLog() {
		return dao.selectLikeLog();
	}

	@Override
	public List<String> selectLogTag(int tNum) {
		return dao.selectLogTag(tNum);
	}

	@Override
	public List<LogVO> selectLogDetail(int tNum) {
		return dao.selectLogDetail(tNum);
	}

}
