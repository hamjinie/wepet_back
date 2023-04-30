package com.edu.wepet.client.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.wepet.domain.Admin;
import com.edu.wepet.domain.PetSitter;
import com.edu.wepet.exception.PetsitterException;
import com.edu.wepet.model.member.PetsitterService;
import com.edu.wepet.util.Message;

@RestController
@RequestMapping("/rest")
public class RestPetsitterController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PetsitterService petsitterService;
 
	
	@GetMapping("/petsitter/apply/status")
	public ResponseEntity<Message> update(PetSitter petSitter){
		
		return null;
	}

	
	@ExceptionHandler(PetsitterException.class)
	public ResponseEntity<Message> handle(PetsitterException e){
		
		Message message= new Message();
		message.setMsg(e.getMessage());
		
		ResponseEntity entity= new ResponseEntity<Message>(message, HttpStatus.BAD_REQUEST);
		
		return entity;

	}
}
