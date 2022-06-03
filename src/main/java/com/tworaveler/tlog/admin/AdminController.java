package com.tworaveler.tlog.admin;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/admin/")
public class AdminController {

	
	ModelAndView mav = new ModelAndView();
	ResponseEntity<String> entity = null;
	
	@GetMapping("main")
	public ModelAndView adminPage(PagingVO pvo, ReportVO vo) {
		mav.setViewName("admin/main");
		return mav;
	}
	
	@GetMapping("travelLogList")
	public ModelAndView travelLogList() {
		mav.setViewName("admin/travelLogList");
		return mav;
	}
	
	@GetMapping("boardList")
	public ModelAndView boardList() {
		mav.setViewName("admin/boardList");
		return mav;
	}
	
	@GetMapping("allMemberList")
	public ModelAndView allMemberList() {
		mav.setViewName("admin/allMemberList");
		return mav;
	}
	
	@GetMapping("reportMemberList")
	public ModelAndView reportMemberList() {
		mav.setViewName("admin/reportMemberList");
		return mav;
	}
	
	@GetMapping("reportList")
	public ModelAndView reportList() {
		mav.setViewName("admin/reportList");
		return mav;
	}
	
}
