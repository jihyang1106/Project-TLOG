package com.tworaveler.tlog.log;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class myLogController {
	@Inject
	LogService service;
	
	@GetMapping("/myLog/myLogList") 
	public ModelAndView logList(HttpSession session, int userNum) { 
		ModelAndView mav  = new ModelAndView();
		mav.addObject("userNum", userNum);
		mav.setViewName("/myLog/myLogList");
		return mav;
	} 
	@GetMapping("/myLog/myLogList/logSearch") 
	public ModelAndView search(HttpSession session, int userNum, String searchStart, String searchEnd) { 
		ModelAndView mav  = new ModelAndView();
		mav.addObject("userNum", userNum);
		mav.addObject("searchStart", searchStart);
		mav.addObject("searchEnd", searchEnd);
		mav.setViewName("/myLog/myLogList");
		return mav;
	}
	//프로필) 일기 리스트
	@ResponseBody // Ajax
	@RequestMapping(value = "/myLog/logLists", method = RequestMethod.GET)
	public List<LogVO> logLists(@RequestParam("startNum") int startNum, int status, int userNum) {
		int limitNum =5; //한 번에 나오는 글 수
		int isWriter=0;
		
		if(userNum==2) { //로그인 한 userNum(임시)
			isWriter = 1;
		}
		List<LogVO> logLists = new ArrayList<LogVO>();
		
		//나의 여행일기
		if(status==0) {
				logLists = service.selectMyLogs(userNum, isWriter, startNum, limitNum);
		//태그된 일기
		}else if(status==1){
			logLists = service.selectTaggedLogs(userNum, isWriter, startNum, limitNum);		
		//좋아요 누른 일기
		}else if(status==2){
			logLists = service.selectLikedLogs(userNum, isWriter, startNum, limitNum);
		}
				
		//vo마다 태그리스트 넣기
		for(LogVO lvo : logLists) {
			lvo.setTagList(service.selectLogTag(lvo.gettNum()));
		}
		return logLists;
	}
	//검색한 나의 여행일기
	@ResponseBody // Ajax
	@RequestMapping(value = "/myLog/searchLists", method = RequestMethod.GET)
	public List<LogVO> searchLists(@RequestParam(value = "startNum") int startNum, int status, int userNum, String searchStart, String searchEnd) {
		int limitNum = 5;
		int isWriter=0;
		
		if(userNum==2) { //로그인 한 userNum(임시)
			isWriter = 1;
		}
		List<LogVO> logLists = new ArrayList<LogVO>();
		
		//나의 여행일기
		if(status==0) {
				logLists = service.searchMyLogs(userNum, isWriter, searchStart, searchEnd, startNum, limitNum);
		//태그된 일기
		}else if(status==1){
			logLists = service.searchTaggedLogs(userNum, isWriter, searchStart, searchEnd, startNum, limitNum);		
		//좋아요 누른 일기
		}else if(status==2){
			logLists = service.searchLikedLogs(userNum, isWriter, searchStart, searchEnd, startNum, limitNum);
		}
		
		//vo마다 태그리스트 넣기
		for(LogVO lvo : logLists) {
			lvo.setTagList(service.selectLogTag(lvo.gettNum()));
		}
		return logLists;
	}
	
	/* ===================== 글쓰기 ======================== */
	@GetMapping("/myLog/logWrite") 
	public ModelAndView logWrite() { 
		ModelAndView mav  = new ModelAndView();
		mav.setViewName("/myLog/logWrite");
		return mav;
	} 
	
	@PostMapping("/myLog/logWriteOk") 
	public String logWriteOk(HttpServletRequest request, LogVO vo) { 
		vo.setUserNum(1); //로그인 userNum((String) request.getSession().getAttribute("logId"))
		vo.setIp(request.getRemoteAddr()); // 접속자 아이피
		int chk = service.logWriteOk(vo);
		
		if(chk>0) { //성공 시 
			System.out.println(vo.gettContent());
			
			// Map<"list",<List<Map<name,value>>>> 형태
			List<Map<String,Object>> dataList = new ArrayList<Map<String,Object>>(); //실제 데이터가 담긴 List
			Map<String,Object> insertMap = new HashMap<String,Object>(); //MyBatis에 던질 Map
			insertMap.put("list",dataList); //MyBatis의 foreach의 collection이름을 key로 List를 put
			
		}else {
			
		}
		
		
		return "/myLog/myLogList?userNum="+vo.getUserNum();
	}
}
