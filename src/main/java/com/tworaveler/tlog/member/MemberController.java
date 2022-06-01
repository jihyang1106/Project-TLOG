package com.tworaveler.tlog.member;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/member/")
public class MemberController {
	/*
	 * // 로그인 폼
	 * 
	 * @GetMapping("login") public String login() { return "/member/login"; } // 카카오
	 * 로그인
	 * 
	 * @GetMapping("kakaologin") public String kakaologin(HttpServletResponse
	 * response, String code, HttpSession session, HttpServletResponse res,
	 * RedirectAttributes redirect)throws IOException { JSONObject tokenJson =
	 * kakao.getToken(code); String accessToken =
	 * tokenJson.getString("access_token"); String refreshToken =
	 * tokenJson.getString("refresh_token");
	 * 
	 * MemberVO kakaoVO = new MemberVO(kakao.getUserInfo(accessToken)); MemberVO
	 * userInfo = service.selectMember(kakaoVO);
	 * 
	 * if(userInfo!=null) { //블랙회원 로그인시 if(userInfo.getVerify()==9) {
	 * response.setContentType("text/html; charset=UTF-8"); PrintWriter out =
	 * response.getWriter(); out.
	 * println("<script>alert('정지된 회원입니다. 정지사유는 관리자에게 문의하세요.');location.href='/member/login';</script>"
	 * ); out.flush(); return "redirect:login"; } session.setAttribute("userInfo",
	 * userInfo); session.setAttribute("accessToken", accessToken);
	 * session.setAttribute("refreshToken", refreshToken);
	 * session.setAttribute("kakao", "true"); setLogCookie(res, session);
	 * if(userInfo.getVerify()==1) { return "redirect:/admin/adminMain"; }else {
	 * return "redirect:/"; } }else { redirect.addFlashAttribute("kakaoVO",
	 * kakaoVO); return "redirect:signup"; } } // 구글 로그인
	 */}