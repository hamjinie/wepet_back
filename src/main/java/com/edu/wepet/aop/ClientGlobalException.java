package com.edu.wepet.aop;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.edu.wepet.exception.AdminException;
import com.edu.wepet.exception.MemberException;



@ControllerAdvice(annotations = Controller.class)
public class ClientGlobalException {
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@ExceptionHandler(MemberException.class)
	public ModelAndView handle(MemberException e) {
		logger.info("클라이언트 글로벌 예외 호출");
		
		ModelAndView mav = new ModelAndView("wepet/client/error/result");
		mav.addObject("e", e);
		return mav;
	}
	
}
