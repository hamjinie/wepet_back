package com.edu.wepet.admin.controller;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Base64;
import java.util.HashMap;
import java.util.Base64.Encoder;

import javax.servlet.http.HttpServletRequest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edu.wepet.model.admin.SalesService;
import com.edu.wepet.util.Message;

@Controller
public class FeeController {
	
	@Autowired
	private SalesService salesService;
	
	@GetMapping("/fee")
	public ModelAndView getFee() {
		List salesList=salesService.selectSum();
		ModelAndView mav=new ModelAndView("wepet/admin/fee");
		mav.addObject(salesList);
		return mav;
	}	
	
	
}
