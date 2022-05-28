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
import com.tworaveler.tlog.member.MemberService;
import com.tworaveler.tlog.member.MemberVO;

@Controller
public class HomeController {
	@Inject
	LogService Lservice;
	
	@Inject
	MemberService Mservice;
	
	@GetMapping("/") 
	public ModelAndView home(HttpSession session) { 
		ModelAndView mav  = new ModelAndView();
		session.setAttribute("logStatus", "Y"); //임시

		//(1) tLog 10개
		if(session.getAttribute("logStatus").equals("Y")) {
			//팔로잉 tLog
			List<LogVO> logList = Lservice.selectFollowLog(1); //임시(logId)
			//vo마다 tNum의 태그리스트 넣기
			for(LogVO vo : logList) {
				vo.setTagList(Lservice.selectLogTag(vo.gettNum()));
			}
			mav.addObject("logList", logList);
		}else {
			//좋아요순 tLog
			List<LogVO> logList = Lservice.selectLikeLog();
			for(LogVO vo : logList) {
				vo.setTagList(Lservice.selectLogTag(vo.gettNum()));
			}
			mav.addObject("logList", logList);
		}
		
		//(2) 팔로워 많은 유저
		List<MemberVO> followedUser = Mservice.FollowedUser();
		for(MemberVO vo : followedUser) {
			vo.setTagList(Mservice.selectmyTag(vo.getUserNum()));
		}
		mav.addObject("followedUser", followedUser);
		
		mav.setViewName("/home");
		return mav;
	} 
	
	@ResponseBody // Ajax
	@RequestMapping(value = "/home/logDetail", method = RequestMethod.GET)
	public List<LogVO> logDetail(@RequestParam("tNum") int tNum) {
		return Lservice.selectLogDetail(tNum);
	}
}
