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

import com.tworaveler.tlog.board.BoardVO;
import com.tworaveler.tlog.log.LogVO;
import com.tworaveler.tlog.member.MemberService;
import com.tworaveler.tlog.member.MemberVO;

@RestController
@RequestMapping("/admin/")
public class AdminController {

	@Inject
	AdminService service;
	
	@Inject
	MemberService memberService;
	
	ModelAndView mav = new ModelAndView();
	ResponseEntity<String> entity = null;
	
	@GetMapping("main")
	public ModelAndView adminPage(PagingVO pvo, LogVO lvo, BoardVO bvo, MemberVO mvo) {
		// 여행일기 게시판
		mav.addObject("tlogTotal", service.selectTlogTotalPosts(pvo, lvo));
		// 자유일기 게시판
		mav.addObject("boardTotal", service.selectBoardTotalPosts(pvo, bvo));
		// 전체 일기 수
		mav.addObject("total", service.selectTlogTotalPosts(pvo, lvo)
				+ service.selectBoardTotalPosts(pvo, bvo));
		// 전체 회원 수
		mav.addObject("user", service.selectTotalUser(pvo, mvo));
		//해시태그 정보 받아오기
		mav.addObject("tagInfo", service.selectTag());
		mav.setViewName("admin/main");
		return mav;
	}
	
	// ajax로 여행일기 보이기
	@GetMapping("tlog")
	public Map<String, Object> tlog(PagingVO pvo, LogVO lvo){
		Map<String, Object> map = new HashMap<>();
		// 페이징 처리 및 여행일기 리스트
		pvo.setTotalPosts(service.selectTlogTotalPosts(pvo,lvo));
		List<LogVO> list = service.selectTlog(pvo, lvo);
		map.put("tlogList", list);
		map.put("paging", pvo);
		return map;
	}

	// ajax로 자유일기 보이기
	@GetMapping("board")
	public Map<String, Object> board(PagingVO pvo, BoardVO bvo){
		Map<String, Object> map = new HashMap<>();
		// 페이징 저리 및 자유일기 리스트
		pvo.setTotalPosts(service.selectBoardTotalPosts(pvo, bvo));
		List<BoardVO> list = service.selectBoard(pvo, bvo);
		map.put("boardList", list);
		map.put("paging", pvo);
		return map;
	}
	
	// 회원게시판 전체회원
	@GetMapping("allMemberList")
	public ModelAndView allMemberList(PagingVO pvo, MemberVO mvo) {
		Map<String, Object> map = new HashMap<>();
		// 페이징 처리 회원 리스트
		/*
		 * pvo.setTotalPosts(service.selectTotalUser(pvo, mvo)); List<MemberVO> list =
		 * service.selectMemberList(pvo, mvo); map.put("memberList", list);
		 * map.put("paging", pvo);
		 */
		mav.addObject("mList", service.selectMemberList(pvo, mvo));
		pvo.setTotalPosts(service.selectTotalUser(pvo, mvo));
		mav.addObject("paging", pvo);
		
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
