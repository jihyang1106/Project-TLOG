package com.tworaveler.tlog;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.tworaveler.tlog.member.MemberVO;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();

		if ((MemberVO)session.getAttribute("userInfo") != null) {
			return true;
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			 
			out.println("<script>alert('로그인 후 이용하세요.'); location.href='/member/login';</script>");
			out.flush();
			return false;
		}
	}
}