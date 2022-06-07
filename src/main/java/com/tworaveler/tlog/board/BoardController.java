package com.tworaveler.tlog.board;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

	@Inject
	BoardService service;

	@GetMapping("/board/board")
	public ModelAndView board(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.setAttribute("logStatus", "Y");
		
		mav.setViewName("board/board");
		return mav;
	}
	
	//전체 로그리스트
	@ResponseBody // Ajax
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public List<BoardVO> logLists(@RequestParam("startNum") int startNum) {
		int limitNum = 10; //한 번에 나오는 글 수
		List<BoardVO> logLists = new ArrayList<BoardVO>();
			logLists = service.selectRecent(startNum, limitNum);
		return logLists;
	}
		
	@ResponseBody // Ajax
	@RequestMapping(value = "/boardWrite", method = RequestMethod.POST)
	public int boardInsert(BoardVO vo, HttpServletRequest request) {
		vo.setIp(request.getRemoteAddr());
		vo.setUserNum(2);
		return service.boardInsert(vo);
	}
	
	//글 삭제하기
		@GetMapping("/board/delOk")
		@ResponseBody
		public int deleteBoard(int boardNum) {
			return service.deleteBoard(boardNum); 
		}
}
