package com.edu.wepet.client.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.edu.wepet.domain.BoardReview;
import com.edu.wepet.model.member.BoardReviewService;
import com.edu.wepet.util.Message;


@RestController
@RequestMapping("/rest")
public class RestBoardReviewController {
	
	@Autowired
	private BoardReviewService boardReviewService;

	

	
}
