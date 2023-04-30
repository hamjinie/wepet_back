package com.edu.wepet.client.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.edu.wepet.domain.BoardReview;
import com.edu.wepet.model.member.BoardReviewService;

@RestController
@RequestMapping("/rest")
public class RestPayController {

	@Autowired
	private BoardReviewService boardReviewService;
			
	@GetMapping("/review")
	public List getList(HttpServletRequest request) {
		return boardReviewService.selectAll();
	}
	
}
