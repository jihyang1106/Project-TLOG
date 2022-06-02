/*
 * package com.tworaveler.tlog;
 * 
 * import javax.inject.Inject; import javax.servlet.http.HttpSession;
 * 
 * import org.springframework.stereotype.Controller; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.servlet.ModelAndView;
 * 
 * import com.tworaveler.tlog.board.BoardService;
 * 
 * @Controller public class BoardController {
 * 
 * @Inject BoardService service;
 * 
 * @GetMapping("/") public ModelAndView board(HttpSession session) {
 * ModelAndView mav = new ModelAndView(); session.setAttribute("logStatus",
 * "Y"); return mav; } }
 */