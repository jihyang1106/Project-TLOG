package com.tworaveler.tlog;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class HomeController {
	
	@GetMapping("/") 
	public ModelAndView home() { 
		ModelAndView mav  = new ModelAndView();
		mav.setViewName("/home");
		return mav;
	} 
}
