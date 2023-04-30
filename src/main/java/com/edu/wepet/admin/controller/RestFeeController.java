package com.edu.wepet.admin.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.edu.wepet.exception.SalesException;
import com.edu.wepet.model.admin.SalesService;
import com.edu.wepet.util.Message;

@RestController
@RequestMapping("/rest")
public class RestFeeController {
	
	private Logger logger=LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SalesService salesService;

	@GetMapping("/fee")
	public List getList(HttpServletRequest request) {
		List salesList=salesService.selectAll();
		//System.out.println("All : "+salesList);
		return salesList;
	}
	
	@GetMapping("/feeSum")
	public List getListSum(HttpServletRequest request) {
		List salesList=salesService.selectSum();
		return salesList;
	}
	
	@PostMapping("/feeList")
	public List selectedList1(@RequestParam("val1") int val1,@RequestParam("val2") int status, HttpServletRequest request) {

		if(status==2){
			status=0;
		}
		//System.out.println("확인용"+val1+status);
		
		List salesList=null;
		if(val1==1) {
			salesList=salesService.selectByCase(status);			
		}else if(val1==2) {
			salesList=salesService.selectByStat(status);			
		}
		//System.out.println("확인용2"+salesList);
		
		return salesList;
	}

	@PostMapping("/giveFee")
	public ResponseEntity<Message> giveFee(@RequestParam("gottenfee") int gottenfee, @RequestParam("getfee") int getfee, @RequestParam("sales_idx") int sales_idx, HttpServletRequest request) {

		int fee=gottenfee+getfee;
		
		HashMap<String, Integer> map=new HashMap(); 
		map.put("fee", fee); 
		map.put("sales_idx", sales_idx); 
		
		//System.out.println(map);
		
		salesService.update(map);
		
		Message message=new Message();
		message.setMsg("수정 성공");
		ResponseEntity<Message> entity=null;
		entity=new ResponseEntity<Message>(message, HttpStatus.OK);
		
//		System.out.println("entity : "+entity);
		
		return entity;
	}
	
	@ExceptionHandler(SalesException.class)
	public ResponseEntity<Message> handle(SalesException e) {
		Message message=new Message();
		message.setMsg(e.getMessage());

		ResponseEntity<Message> entity=null;
		entity=new ResponseEntity<Message>(message, HttpStatus.INTERNAL_SERVER_ERROR);
		
		return entity;
	}
	
	
}
