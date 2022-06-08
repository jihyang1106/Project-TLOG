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

import com.tworaveler.tlog.admin.AdminService;
import com.tworaveler.tlog.member.MemberVO;

@Controller
public class BoardController {

	@Inject
	BoardService service;
	
	@GetMapping("/board/board")
	public ModelAndView board(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberVO userInfo = (MemberVO) session.getAttribute("userInfo");
		if (userInfo != null) {
			mav.addObject("userInfo", userInfo);
		}else {
			mav.addObject("notLogined", "Y");
		}
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
	public int boardInsert(BoardVO vo, HttpServletRequest request, HttpSession session) {
		MemberVO userInfo = (MemberVO) session.getAttribute("userInfo");
		System.out.println("아이피"+request.getRemoteAddr());
		vo.setUserNum(userInfo.getUserNum());
		vo.setIp(request.getRemoteAddr());
<<<<<<< HEAD
		
=======
>>>>>>> 381101be7c7afee54f1b0ced5635dabc2a98e3d9
		return service.boardInsert(vo);
	}
	
	//글 삭제하기
		@GetMapping("/board/delOk")
		@ResponseBody
		public int deleteBoard(int boardNum) {
			return service.deleteBoard(boardNum); 
		}
}
