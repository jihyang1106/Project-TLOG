package com.tworaveler.tlog;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tworaveler.tlog.log.LogService;
import com.tworaveler.tlog.log.LogVO;
import com.tworaveler.tlog.member.MemberVO;

@Controller
public class HomeController {
	@Inject
	LogService service;
	
	@GetMapping("/") 
	public ModelAndView home(HttpSession session) { 
		ModelAndView mav  = new ModelAndView();
		MemberVO userInfo = (MemberVO) session.getAttribute("userInfo");
		//(1) tLog 10개
		if(userInfo!=null) {
			mav.addObject("userInfo", userInfo);
			//팔로잉 tLog
			List<LogVO> logList = service.selectFollowLog(userInfo.getUserNum()); //임시(logId)
			//vo마다 tNum의 태그리스트 넣기
			for(LogVO vo : logList) {
				vo.setTagList(service.selectLogTag(vo.gettNum()));
			}
			mav.addObject("logList", logList);
		}else {
			//좋아요순 tLog
			List<LogVO> logList = service.selectLikeLog();
			for(LogVO vo : logList) {
				vo.setTagList(service.selectLogTag(vo.gettNum()));
			}
			mav.addObject("logList", logList);
		}
		
		//(2) 팔로워 많은 유저
		List<MemberVO> followedUser = service.FollowedUser();
		for(MemberVO vo : followedUser) {
			vo.setTagList(service.selectMyTag(vo.getUserNum()));
		}
		mav.addObject("followedUser", followedUser);
		
		//(3) 태그 리스트
		List<LogVO> tagList = service.selectTagAll();
		mav.addObject("tagList", tagList);
		mav.setViewName("/home");
		return mav;
	} 
	
	@ResponseBody // Ajax
	@RequestMapping(value = "/home/logDetail", method = RequestMethod.GET)
	public List<LogVO> logDetail(@RequestParam("tNum") int tNum) {
		List<LogVO> detailList = service.selectLogDetail(tNum);
		for(LogVO vo : detailList) {
			vo.setTagUserList(service.selectTagUsers(tNum));
		}
		return detailList;
	}
}