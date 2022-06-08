package com.tworaveler.tlog.log;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LogWriteController {
	@Inject
	LogService service;

	/* ===================== 글쓰기폼 ======================== */
	@GetMapping("/logShare/logWrite")
	public ModelAndView logWrite() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("tagList", service.selectTagAll());
		mav.setViewName("/logShare/logWrite");
		return mav;
	}
	/* ===================== userNick으로 user검색하기 ======================== */
	@ResponseBody // Ajax
	@RequestMapping(value = "/logShare/searchUserList", method = RequestMethod.GET)
	public List<LogVO> searchUserList(String userNick) {
		return service.getUserListByNick("%" + userNick + "%");
	}
	/* =============== 파일업로드/ travelLog, tagLog, tagUser 등록 ================== */
	@ResponseBody // Ajax
	@RequestMapping(value = "/logShare/logWriteOk", method = RequestMethod.POST)
	public List<String> logWriteOk(LogVO vo, HttpServletRequest request) {
		vo.setUserNum(2); // 로그인 userNum((String) request.getSession().getAttribute("logId"))
		vo.setIp(request.getRemoteAddr()); // 접속자 아이피
		List<String> fileNames = new ArrayList<String>();//ajax로 보낼 변환된 파일명
		
		//파일 업로드
		String path = request.getSession().getServletContext().getRealPath("/upload/log");
	    System.out.println("실제 경로 = "+path);
		try {
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;

			List<MultipartFile> files = mr.getFiles("images");
			System.out.println("업로드 파일 수 -> "+files.size());
			
			if(files!=null) {
				for(int i=0; i<files.size(); i++) {
					MultipartFile mf = files.get(i);
					
					String orgFileName = mf.getOriginalFilename();
					System.out.println(i+1+"번째 파일명 -> "+ orgFileName );
					int point = orgFileName.lastIndexOf(".");
					String ext = orgFileName.substring(point); //확장자
					String newFileName = System.currentTimeMillis()+i+ext;
					System.out.println("변환후 파일명 -> "+newFileName);
					
					fileNames.add(newFileName); //파일명 리스트에 추가
					File f = new File(path, newFileName);
					
					try {
						mf.transferTo(f); //파일 업로드 시점
						System.out.println("file = "+f);
					}catch(Exception ee) {
						ee.printStackTrace();
					}
				}
		    	
				//DB UPDATE
				service.logWriteOk(vo); // travelLog 테이블
				int tNum =service.getTNum(vo.getUserNum());//방금 넣은 tNum가져오기
				vo.settNum(tNum); 
				service.insertUserList(vo);
				service.insertTagList(vo);
				System.out.println("글쓰기 완료");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(fileNames);
		return fileNames; // "/logShare/logShareList?userNum=" + vo.getUserNum();
	} //파일업로드, 글등록 확인완료
	
	/* ===================== travelDetail 등록 ======================== */
	@ResponseBody // Ajax
	@RequestMapping(value = "/logShare/detailWriteOk", method = RequestMethod.POST)
	public int detailWriteOk(HttpServletRequest request, @RequestBody List<Map<String,Object>> dataList) {
		int userNum =1; // 로그인 userNum  ((String) request.getSession().getAttribute("logId"))
		int tNum = service.getTNum(userNum); //방금 넣은 tNum가져오기
		System.out.println("tNum = "+ tNum);
				
		Map<String,Object> insertMap = new HashMap<String,Object>(); //MyBatis에 던질 Map
    	insertMap.put("list",dataList); //MyBatis의 foreach의 collection이름을 key(현재는"list")로 List를 put    	
    	int chk = service.detailWriteOk(tNum, insertMap); //travelDetail 테이블
    	
    	if(chk>0) {
    		return userNum;
    	}
		return 0;
	}
	
	//~~~~~~~~~~~~~~~~~~~~~~~~~ 글 삭제 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	@ResponseBody // Ajax
	@RequestMapping(value = "/logShare/logDel", method = RequestMethod.GET)
	public int logDel(@RequestParam("tNum") int tNum){
		service.logDel(tNum);
		return 2; //로그인 유저넘버
	}
	
	//~~~~~~~~~~~~~~~~~~~~~~~~~ 글 수정폼 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	@GetMapping("/logShare/logEdit")
	public ModelAndView logEdit(int tNum){
		ModelAndView mav  = new ModelAndView();
		int logUser = 2; //로그인 한 유저넘버
		LogVO vo = service.getOneLog(tNum, logUser);	
		
		if(vo.getUserNum()!=logUser) {//작성자가 아니라면
			System.out.println("나가라");
			mav.setViewName("redirect:/logShare/logView?tNum="+tNum); //logView로 리다이렉트	
		}else {			
			
			vo.setTagList(service.selectLogTag(tNum)); //태그리스트 넣기
			
			vo.setTagUserList(service.selectTagUsers(tNum)); //태그된 유저리스트 넣기
			int cnt = vo.getTagUserList().size();
			
			mav.addObject("cnt", cnt);
			mav.addObject("tagList", service.selectTagAll());
			mav.addObject("vo", vo);
			mav.addObject("detailList", service.selectLogDetail(tNum));
			mav.setViewName("/logShare/logEdit");
		}
		return mav;
	}
	
	//~~~~~~~~~~~~~~~~~~~~~~~~~ 글 수정 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	@ResponseBody // Ajax
	@RequestMapping(value = "/logShare/logEditOk", method = RequestMethod.POST)
	public int logEditOk(LogVO vo){
		service.logDel(vo.gettNum());
		return 2; //로그인 유저넘버
	}
}
