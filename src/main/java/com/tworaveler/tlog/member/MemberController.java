package com.tworaveler.tlog.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tworaveler.tlog.log.LogService;
import com.tworaveler.tlog.log.LogVO;

@Controller
public class MemberController {
	@Inject
	LogService logService;
	@Inject
	MemberService memberService;
	/*
	 * // 로그인 폼
	 * 
	 * @GetMapping("login") public String login() { return "/member/login"; } //
	 * 카카오로그인
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
	 * println("<script>aljert('정지된 회원입니다. 정지사유는 관리자에게 문의하세요.');location.href='/member/login';</script>"
	 * ); out.flush(); return "redirect:login"; } session.setAttribute("userInfo",
	 * userInfo); session.setAttribute("accessToken", accessToken);
	 * session.setAttribute("refreshToken", refreshToken);
	 * session.setAttribute("kakao", "true"); if(userInfo.getVerify()==1) { return
	 * "redirect:/admin/adminMain"; }else { return "redirect:/"; } }else{
	 * redirect.addFlashAttribute("kakaoVO", kakaoVO); return "redirect:signup"; } }
	 */
	// 구글 로그인
	@GetMapping("/member/login")
	public String loginForm() {
		return "member/login";
	}
	@GetMapping("/member/welcomePage")
	public String welcomePage() {
		return "member/welcomePage";
	}
	@GetMapping("/member/profile")
	public ModelAndView myProfile(int userNum) {
		ModelAndView mav = new ModelAndView();
		//게시글 수 받아오기
		int limitNum =5; //한 번에 나오는 글 수
		int isWriter=0;
		int loginUserNum=2;//로그인 한 userNum(임시)
		
		if(userNum==loginUserNum) { //로그인 한 userNum(임시)와 현재 열람중인 프로필 num이 같다면
			isWriter = 1;
		}
		mav.addObject("myLogCount", logService.selectMyLogs(userNum, isWriter, 0, limitNum).size());
		//팔로워 받아오기
		mav.addObject("followerCount", memberService.setFollowerInfo(userNum).size());
		System.out.println(memberService.setFollowerInfo(userNum).size()+"GGGGGGGG");
		mav.addObject("followerList", memberService.setFollowerInfo(userNum));
		//팔로우하는 사람 받아오기
		mav.addObject("followCount", memberService.setFollowInfo(userNum).size());
		mav.addObject("followList", memberService.setFollowInfo(userNum));

		mav.setViewName("member/profile");
		return mav;
	}
	//유저 프로필 페이지 LOG탭 ajax 로 데이터 넘겨주기
	@ResponseBody
	@RequestMapping(value = "/member/profileLogList", method = RequestMethod.GET)
	public List<LogVO> logLists(@RequestParam("startNum") int startNum, int status, int userNum) {
		int limitNum =5; //한 번에 나오는 글 수
		int isWriter=0;
		int loginUserNum=2;//로그인 한 userNum(임시)
		
		if(userNum==loginUserNum) { //로그인 한 userNum(임시)와 현재 열람중인 프로필 num이 같다면
			isWriter = 1;
		}
		List<LogVO> logLists = new ArrayList<LogVO>();
		
		//나의 여행일기
		if(status==0) {
			logLists = logService.selectMyLogs(userNum, isWriter, startNum, limitNum);
		//태그된 일기
		}else if(status==1){
			logLists = logService.selectTaggedLogs(userNum, isWriter, startNum, limitNum);		
		//좋아요 누른 일기
		}else if(status==2){
			logLists = logService.selectLikedLogs(userNum, isWriter, startNum, limitNum);
		}
				
		//vo마다 태그리스트 넣기
		for(LogVO lvo : logLists) {
			lvo.setTagList(logService.selectLogTag(lvo.gettNum()));
		}
		return logLists;
	}
	//검색한 userProfile
	@ResponseBody
	@RequestMapping(value = "/member/searchAtProfileLogList", method = RequestMethod.GET)
	public List<LogVO> searchLists(@RequestParam(value = "startNum") int startNum, int status, int userNum, String searchStart, String searchEnd) {
		int limitNum = 5;
		int isWriter=0;
		int loginUserNum=2;//로그인 한 userNum(임시)
		
		if(userNum==loginUserNum) { //로그인 한 userNum(임시)와 현재 열람중인 프로필 num이 같다면
			isWriter = 1;
		}
		List<LogVO> logLists = new ArrayList<LogVO>();
		
		//나의 여행일기
		if(status==0) {
			logLists = logService.searchMyLogs(userNum, isWriter, searchStart, searchEnd, startNum, limitNum);
		//태그된 일기
		}else if(status==1){
			logLists = logService.searchTaggedLogs(userNum, isWriter, searchStart, searchEnd, startNum, limitNum);		
		//좋아요 누른 일기
		}else if(status==2){
			logLists = logService.searchLikedLogs(userNum, isWriter, searchStart, searchEnd, startNum, limitNum);
		}
		
		//vo마다 태그리스트 넣기
		for(LogVO lvo : logLists) {
			lvo.setTagList(logService.selectLogTag(lvo.gettNum()));
		}
		return logLists;
	}
	@GetMapping("userEdit")
	public String userEdit() {
		return "member/userEdit";
	}
}
