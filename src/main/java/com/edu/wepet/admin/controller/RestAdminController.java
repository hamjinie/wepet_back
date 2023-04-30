package com.edu.wepet.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.wepet.client.controller.PesitterController;
import com.edu.wepet.domain.Admin;
import com.edu.wepet.domain.Member;
import com.edu.wepet.domain.PetSitter;
import com.edu.wepet.model.admin.AdminService;
import com.edu.wepet.model.member.MemberService;
import com.edu.wepet.model.member.PetsitterService;
import com.edu.wepet.util.Message;


@RestController
@RequestMapping("/rest")
public class RestAdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PetsitterService petsitterService;
	
	//로그인 요청 처리 
	@PostMapping("/login/admin")
	public ResponseEntity<Message> loginCheck(Admin admin, HttpServletRequest request){
		//3단계 일시키기
		Admin obj=adminService.select(admin);
		
		//세션에 담기
		HttpSession session=request.getSession();
		session.setAttribute("admin", obj);
			
		Message message = new Message();
		message.setMsg("로그인성공");
		
		ResponseEntity entity = new ResponseEntity<Message>(message, HttpStatus.OK);
		return entity;
	}

	
	//일반회원목록 요청 처리
	@GetMapping("/member")
	public List getList(HttpServletRequest request){
		
		List memberList = memberService.selectAll();
		
		return memberList;
	}
	
	//회원목록 요청 처리
	@GetMapping("/petsitter")
	public List getSitterList(HttpServletRequest request){
		
		List petsitterList= petsitterService.selectAll();
		
		return petsitterList;
	}
	
}






