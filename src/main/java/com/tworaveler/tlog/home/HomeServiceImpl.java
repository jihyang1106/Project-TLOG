package com.tworaveler.tlog.home;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tworaveler.tlog.vo.LogVO;
import com.tworaveler.tlog.vo.MemberVO;

@Service
public class HomeServiceImpl implements HomeService{
	@Inject
	HomeDAO dao;

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

}
