package com.tworaveler.tlog;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tworaveler.tlog.log.LogService;
import com.tworaveler.tlog.log.LogVO;

@Controller
public class HomeController {
	@Inject
	LogService service;
	
	@GetMapping("/") 
	public ModelAndView home(HttpSession session) { 
		ModelAndView mav  = new ModelAndView();
		session.setAttribute("logStatus", ""); //임시
		//로그인 여부
		if(session.getAttribute("logStatus").equals("Y")) {
			//팔로잉 tLog 10개
			mav.addObject("logList", "추가예정");
		}else {
			//좋아요순 tLog 10개
			List<LogVO> logList = service.selectLikeLog();
			//vo마다 tNum의 태그리스트 넣기
			for(LogVO vo : logList) {
				vo.setTagList(service.selectLogTag(vo.gettNum()));
			}
			mav.addObject("logList", logList);
		}
		
		mav.setViewName("/home");
		return mav;
	} 
}
