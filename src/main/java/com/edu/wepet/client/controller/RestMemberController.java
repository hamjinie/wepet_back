package com.edu.wepet.client.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edu.wepet.domain.Member;
import com.edu.wepet.model.member.MemberService;
import com.edu.wepet.sns.GoogleLogin;
import com.edu.wepet.sns.KakaoLogin;
import com.edu.wepet.sns.NaverLogin;
import com.edu.wepet.util.Message;


@RestController
@RequestMapping("/rest")
public class RestMemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private GoogleLogin googleLogin;
	
	@Autowired
	private KakaoLogin kakaoLogin;
	
	@Autowired
	private NaverLogin naverLogin;
	
	
	
	
	//로그인 폼에서 사용할 sns 인증화면의 링크 주소 요청을 처리(구글)
	 @GetMapping("/member/authform/google")
	public ResponseEntity<Message> getGoogleUrl(HttpServletRequest request){
		
		//사용자가 보게 될 인증화면에 대한 주소 구하기
		String url = googleLogin.getGrantUrl(); 
	
		Message message = new Message();
		message.setMsg(url);
		
		ResponseEntity entity=new ResponseEntity<Message>(message, HttpStatus.OK);
		return entity;
	} 
	 
		//로그인폼 - 카카오 로그인 요청처리
	 @GetMapping("/member/authform/kakao")
	public ResponseEntity<Message> getKakaoUrl(HttpServletRequest request){

		String url = kakaoLogin.getGrantUrl();  		//인증화면으로 가기위한 주소 얻기
	
		Message message = new Message();
		message.setMsg(url);
		
		ResponseEntity entity=new ResponseEntity<Message>(message, HttpStatus.OK);
		return entity;
	} 
	 
	 
		//로그인 폼 -네이버
	 @GetMapping("/member/authform/naver")
	public ResponseEntity<Message> getNaverUrl(HttpServletRequest request){

		String url = naverLogin.getGrantUrl();  		//인증화면으로 가기위한 주소 얻기
	
		Message message = new Message();
		message.setMsg(url);
		
		ResponseEntity entity=new ResponseEntity<Message>(message, HttpStatus.OK);
		return entity;
	} 
	 
	 
	
	
}
