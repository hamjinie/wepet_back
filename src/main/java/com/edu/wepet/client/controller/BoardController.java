package com.edu.wepet.client.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


//고객센터 및 펫시터 지원 보드
@Controller
public class BoardController {

	//고객센터 메인 호출
	@GetMapping("/qnaboard/main")
	public ModelAndView getBoardList(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView("wepet/client/qna_board/list");
		return mav;
	}
	
	


}
