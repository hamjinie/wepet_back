package com.edu.wepet.client.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	@GetMapping("/")
	public ModelAndView getMain(HttpServletRequest request) { 
		 
		//메인 
		ModelAndView mav= new ModelAndView();
		mav.setViewName("wepet/client/client_basic_form");
		
		return mav;
	}	
	
	
	

}
