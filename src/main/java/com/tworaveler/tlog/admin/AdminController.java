package com.tworaveler.tlog.admin;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/admin/")
public class AdminController {

	ModelAndView mav = new ModelAndView();
	
	@GetMapping("main")
	public ModelAndView adminPage() {
		mav.setViewName("admin/main");
		return mav;
	}
}
