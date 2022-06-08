package com.tworaveler.tlog;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.tworaveler.tlog.member.MemberVO;

public class AdminLoginInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//System.out.println("어드민인터셉터");
				
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("userInfo");
		if(mvo!=null) {
			if (mvo.getStatus()==1) {
				return true;
			} else {

				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				 
				out.println("<script>alert('관리자 계정으로만 접근 가능한 페이지입니다.'); location.href='/';</script>");
				out.flush();
				return false;
			}
		}else {
			response.sendRedirect("/member/login");
			return false;
		}
	}
}
