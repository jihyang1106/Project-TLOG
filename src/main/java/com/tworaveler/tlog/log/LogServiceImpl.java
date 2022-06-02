package com.tworaveler.tlog.log;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tworaveler.tlog.member.MemberVO;

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

	@Override
	public List<LogVO> selectFollowLog(int userNum) {
		return dao.selectFollowLog(userNum);
	}

	@Override
	public List<String> selectTagAll() {
		return dao.selectTagAll();
	}

	@Override
	public List<MemberVO> FollowedUser() {
		return dao.FollowedUser();
	}

	@Override
	public List<String> selectmyTag(int userNum) {
		return dao.selectmyTag(userNum);
	}

	@Override
	public List<LogVO> selectTagUsers(int tNum) {
		return dao.selectTagUsers(tNum);
	}

	@Override
	public List<LogVO> selectLogLists(int startNum, int limit) {
		return dao.selectLogLists(startNum, limit);
	}

	@Override
	public List<LogVO> selectSearchLists(String searchKey, String string, int startNum, int limitNum) {
		return dao.selectSearchLists(searchKey, string, startNum, limitNum);
	}

	@Override
	public List<LogVO> selectSearchListsTag(String string, int startNum, int limitNum) {
		return dao.selectSearchListsTag(string, startNum, limitNum);
	}

}
