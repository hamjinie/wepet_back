package com.edu.wepet.client.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.wepet.domain.PreReservation;
import com.edu.wepet.exception.PreReservationException;
import com.edu.wepet.model.prereservation.PreReservationService;
import com.edu.wepet.util.Message;

@RestController
@RequestMapping("/rest")
public class RestClientController {

	@Autowired
	private PreReservationService preReservationService;

	private Logger logger=LoggerFactory.getLogger(this.getClass());
	
	
	@GetMapping("/reservation")
	public List<PreReservation> getList(HttpServletRequest request){
		
		List registedPreReservataionList= preReservationService.selectAll();
		
		logger.info("registedPreReservataionList"+registedPreReservataionList);
		
		return preReservationService.selectAll();
		
	}
	
	@PostMapping("/reservation")
	public ResponseEntity<Message> registHoliday(HttpServletRequest request, @RequestBody List<PreReservation> preReservationList){
		
		logger.info("holidayList에 등록전 "+preReservationList);
		
		preReservationService.insert(preReservationList);
		
		Message message= new Message();
		message.setMsg("휴무등록완료");
		
		ResponseEntity entity= new ResponseEntity<Message>(message, HttpStatus.OK);
		
		return entity;
	}
	
	@ExceptionHandler(PreReservationException.class)
	public ResponseEntity<Message> handle(PreReservationException e){
		
		Message message= new Message();
		message.setMsg(e.getMessage());
		
		ResponseEntity entity= new ResponseEntity<Message>(message, HttpStatus.BAD_REQUEST);
		
		return entity;

	}
}
