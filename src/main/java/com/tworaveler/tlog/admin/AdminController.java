package com.tworaveler.tlog.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.tworaveler.tlog.log.LogVO;

@RestController
@RequestMapping("/admin/")
public class AdminController {

	@Inject
	AdminService service;
	
	ModelAndView mav = new ModelAndView();
	ResponseEntity<String> entity = null;
	
	@GetMapping("main")
	public ModelAndView adminPage(PagingVO pvo, LogVO lvo, AdminVO avo) {
		// 여행일기 게시판
		int tlogTotal = service.selectTlogTotalPosts(pvo, lvo);
		mav.addObject("tlogTotal", tlogTotal);

		// 자유일기 게시판
		int boardTotal = service.selectBoardTotalPosts(pvo, avo);
		mav.addObject("boardTotal", boardTotal);
		
		// 전체 게시판 
		int total = tlogTotal + boardTotal;
		mav.addObject("total", total);
		// 전체 회원 수
		mav.addObject("user", service.selectTotalUser());

		// 자유일기 게시판
		mav.addObject("board", service.selectBoard(pvo, avo));
		
		mav.addObject("tlogList",service.selectTlog(pvo, lvo));
		
		mav.setViewName("admin/main");
		return mav;
	}
	
	// ajax로 여행일기 보이기
	@GetMapping("tlog")
	public Map<String, Object> tlog(PagingVO pvo, LogVO lvo){
		Map<String, Object> map = new HashMap<>();
		pvo.setTotalPosts(service.selectTlogTotalPosts(pvo,lvo));
		List<LogVO> list=service.selectTlog(pvo, lvo);
		map.put("tlogList", list);
		map.put("paging", pvo);
		
		return map;
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
