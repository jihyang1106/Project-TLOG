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
