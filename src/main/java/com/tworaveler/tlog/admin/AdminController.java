package com.tworaveler.tlog.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.tworaveler.tlog.board.BoardService;
import com.tworaveler.tlog.board.BoardVO;
import com.tworaveler.tlog.log.LogService;
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
	
	@Inject
	LogService logService;
	
	@Inject
	BoardService boardService;
	
	ModelAndView mav = new ModelAndView();
	ResponseEntity<String> entity = null;
	
	@GetMapping("main")
	public ModelAndView adminPage(PagingVO pvo, LogVO lvo, BoardVO bvo, MemberVO mvo, HttpSession session) {
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
		
		mav.addObject("userInfo", (MemberVO) session.getAttribute("userInfo"));
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
		// 페이징 처리 회원 리스트
		pvo.setTotalPosts(service.selectTotalUser(pvo, mvo));
		mav.addObject("paging", pvo);
		mav.addObject("mList", service.selectMemberList(pvo, mvo));
		
		mav.setViewName("admin/allMemberList");
		return mav;
	}
	
	// 여행일기 글 삭제 
	@GetMapping("delTlog")
	public int deleteTlog(int tNum) {
		return logService.logDel(tNum);
	}
	
	// 자유일기 글 삭제
	@GetMapping("delBoard")
	public int deleteBoard(int boardNum) {
		return boardService.deleteBoard(boardNum);
	}
	
	// 관리자 회원 여부
	@GetMapping("memberAdmin")
	public int selectMemberAdmin(int userNum) {
		return  service.selectMemberAdmin(userNum);
	}
	
	// 관리자 권한 부여 및 취소
	@GetMapping("updateAdmin")
	public int updateMemberAdmin(MemberVO vo) {
		return service.updateAdmin(vo);
	}

}
