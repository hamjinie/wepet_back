package com.edu.wepet.client.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.edu.wepet.domain.Email;
import com.edu.wepet.domain.Member;
import com.edu.wepet.domain.Phone;
import com.edu.wepet.domain.Sns;
import com.edu.wepet.exception.MemberException;
import com.edu.wepet.model.member.EmailService;
import com.edu.wepet.model.member.MemberService;
import com.edu.wepet.model.member.SnsService;
import com.edu.wepet.sns.GoogleLogin;
import com.edu.wepet.sns.GoogleOAuthToken;
import com.edu.wepet.sns.KakaoLogin;
import com.edu.wepet.sns.KakaoOAuthToken;
import com.edu.wepet.sns.NaverLogin;
import com.edu.wepet.sns.NaverOAuthToken;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;


//회원과 관련된 요청을 처리하는 하위 컨트롤러
@Controller
public class MemberController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private GoogleLogin googleLogin;
	
	@Autowired
	private KakaoLogin kakaoLogin;
	
	@Autowired
	private NaverLogin naverLogin;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SnsService snsService;

	
	@Autowired
	private EmailService emailService;
		
	
	//로그인 폼 요청
	@GetMapping("/member/loginform")
	public ModelAndView getLoginForm(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView("wepet/client/login/loginform");
		return mav;
	}
	
	//로그아웃 처리
    @GetMapping("/member/logout")
    public ModelAndView getLogout(HttpServletRequest request) throws MemberException{
        
        logger.info("logout 요청, 세션 주기기");
        
        HttpSession session = request.getSession();
        session.invalidate();
		
		ModelAndView mav = new ModelAndView("redirect:/");
        return mav;        
        
    }
	
	
	//구글 로그인 콜백.
	@GetMapping("/sns/google/callback")
	public ModelAndView googleCallback(HttpServletRequest request, HttpSession session) {

		String code=request.getParameter("code");

		logger.info("구글에서 발급된 코드는" + code);
		
		/* ----------------------------------------------------------------------------------- 
		 1) 토큰 취득을 위한 POST 헤더 와 바디 구성하기 ----이걸 구글에서 요구하니까, 보내줘야 이제 인증이 완료되는 것.
		 -------------------------------------------------------------------------------------- */
		String url= googleLogin.getToken_request_url();
		
		//바디의 파라미터 구성하기 <파라미터명, 파라미터 값>   
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		
		params.add("code", code);
		params.add("client_id", googleLogin.getClient_id());
		params.add("client_secret", googleLogin.getClient_secret());
		params.add("redirect_uri", googleLogin.getRedirect_uri());
		params.add("grant_type", googleLogin.getGrant_type());
		
		//post 방식의 헤더 (application/x-www-form-urlencoded)
		HttpHeaders headers = new HttpHeaders();
		headers.add("Contet-Type", "application/x-www-form-urlencoded");
		
		//머리와 몸 합치기
		HttpEntity httpEntity = new HttpEntity(params, headers);

		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, httpEntity, String.class);
		
		//logger.info("구글에서 넘겨받은 응답정보 "+ responseEntity);
		
		/* ----------------------------------------------------------------------------------- 
		 2) 토큰 요청 후, ResponseEntity 로부터 토큰 꺼내기(String에 불과하므로...)
		 -------------------------------------------------------------------------------------- */
		String body = responseEntity.getBody();
		logger.info("구글에서 넘겨받은 응답정보" + body);
		
		ObjectMapper objectMapper = new ObjectMapper();
		GoogleOAuthToken oAuthToken = null;

		try {
			oAuthToken = objectMapper.readValue(body, GoogleOAuthToken.class);
			
			
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		/* ----------------------------------------------------------------------------------- 
		 3) 토큰을 이용하여, 회원정보에 접근
		 -------------------------------------------------------------------------------------- */
		
		String userinfo_url = googleLogin.getUserinfo_url();

		HttpHeaders headers2 = new HttpHeaders();
												//Bearer(한칸 뛰고) + 위의 토큰을 담는다.
		headers2.add("Authorization", "Bearer "+oAuthToken.getAccess_token());
		HttpEntity entity = new HttpEntity(headers2);
		
		//비동기 객체를 이요한 get 요청
		RestTemplate restTemplate2 = new RestTemplate();
		ResponseEntity<String> userEntity = restTemplate2.exchange(userinfo_url, HttpMethod.GET, entity, String.class);
		
		String userBody =  userEntity.getBody();
		logger.info(userBody);
		
		HashMap<String, Object> userMap=new HashMap<String, Object>();
		ObjectMapper objectMapper2 = new ObjectMapper();
		try {
			userMap = objectMapper2.readValue(userBody, HashMap.class);
			
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		String id =(String)userMap.get("id");
		//String email =(String)userMap.get("email");
		//boolean verified_email = (Boolean)userMap.get("verified_email");
		String nickname =(String)userMap.get("name");
		
		logger.info("id " +id);
		
		
		
		//멤버에 대한 고유 id 조회 -- dao
		Member member = memberService.selectById(id);
		
		//회원정보가 없다면 회원가입  --- 로그인은 
		if(member==null) {
		//이미 디비에 이 회원의 식별고유 id가 존재할 경우
		//로그인을 처리해주자 (서비스의 regist 후 세션에 담자)
			//snsservice를 만들어야 
			
			member = new Member();
			Email email = new Email();
			email.setEmailaddr((String)userMap.get("email"));
			
			Sns sns= snsService.selectByType("google");
			logger.info("sns에 들어있는 sns_idx" + sns);

			member.setSns(sns);
			member.setEmail(email);
			member.setId(id);
			member.setNickname(nickname);
			
			//회원정보없으니까 -가입시키기
 			memberService.regist(member);
 			logger.info("방금 등록한 회원인 경우의 member_idx " + member.getMember_idx());
		}else{			
			logger.info("이미 회원인 경우의 member_idx " + member.getMember_idx());
		}
		
		
		//나머지는 로그인을 그냥 가면 된다.	
		session.setAttribute("member", member);
		ModelAndView mav = new ModelAndView("redirect:/");
		
		return mav;
	}
	

	//카카오 로그인 콜백
	@GetMapping("/sns/kakao/callback")
	public ModelAndView kakaoCallback(HttpServletRequest request, HttpSession session) {

		String code=request.getParameter("code");

		logger.info("카카오에서 발급된 코드는" + code);
		
		/* ----------------------------------------------------------------------------------- 
		 1) 토큰 취득을 위한 POST 헤더 와 바디 구성하기 ----이걸 구글에서 요구하니까, 보내줘야 이제 인증이 완료되는 것.
		 -------------------------------------------------------------------------------------- */
		String url= kakaoLogin.getToken_request_url();
		
		//바디의 파라미터 구성하기 <파라미터명, 파라미터 값>   
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		
		params.add("code", code);
		params.add("client_id", kakaoLogin.getClient_id());
		params.add("redirect_uri", kakaoLogin.getRedirect_uri());
		params.add("grant_type", kakaoLogin.getGrant_type());
		
		//post 방식의 헤더 (application/x-www-form-urlencoded)
		HttpHeaders headers = new HttpHeaders();
		headers.add("Contet-Type", "application/x-www-form-urlencoded");
		
		//머리와 몸 합치기
		HttpEntity httpEntity = new HttpEntity(params, headers);

		//요청 시도를 위한 객체 생성, 비동기방식의 요청을 위한 객체
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, httpEntity, String.class);
		
		//logger.info("구글에서 넘겨받은 응답정보 "+ responseEntity); */
		
		/* ----------------------------------------------------------------------------------- 
		 2) 토큰 요청 후, ResponseEntity 로부터 토큰 꺼내기(String에 불과하므로...)
		 -------------------------------------------------------------------------------------- */
		String body = responseEntity.getBody();
		logger.info("카카오에서 넘겨받은 응답정보" + body);
		
		
		//json으로 되어있는 문자열을 파싱하여, 자바의 객체에 옮겨담자
		ObjectMapper objectMapper = new ObjectMapper();
		KakaoOAuthToken oOAuthToken = null;

		try {
			oOAuthToken = objectMapper.readValue(body, KakaoOAuthToken.class);
			
			
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		 
		/* ----------------------------------------------------------------------------------- 
		 3) 토큰을 이용하여, 회원정보에 접근 (3사가 모두 똑같음, 여기는 표준)
		 -------------------------------------------------------------------------------------- */		
		 String userinfo_url = kakaoLogin.getUserinfo_url();
		

		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer "+oOAuthToken.getAccess_token());
		HttpEntity entity = new HttpEntity(headers2);
		
		RestTemplate restTemplate2 = new RestTemplate();
		ResponseEntity<String> userEntity = restTemplate2.exchange(userinfo_url, HttpMethod.GET, entity, String.class);
		
		String userBody =  userEntity.getBody();
		logger.info(userBody);
		

		HashMap<String, Object> userMap=new HashMap<String, Object>();
		ObjectMapper objectMapper2 = new ObjectMapper();
		try {
			userMap = objectMapper2.readValue(userBody, HashMap.class);
			
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		
		String id = String.valueOf(userMap.get("id"));
		String connected_at = (String)userMap.get("connected_at");
		
		//내부의 json은 맵으로 처리
		Map properties=(Map)userMap.get("properties");
		String nickname = (String)properties.get("nickname");
		
		Map kakao_account=(Map) userMap.get("kakao_account");
        //String email = (String)kakao_account.get("email");
		
		logger.info("nickname is " + nickname);

		//멤버에 대한 고유 id 조회 -- dao
		Member member = memberService.selectById(id);
		
		
		//회원정보가 없다면 회원가입  --- 로그인은 
		if(member==null) {
		//이미 디비에 이 회원의 식별고유 id가 존재할 경우
		//로그인을 처리해주자 (서비스의 regist 후 세션에 담자)
			//snsservice를 만들어야 함
			
			member = new Member();
			
			Email email = new Email();
			email.setEmailaddr((String)kakao_account.get("email"));
			logger.info("email에 뭐 들었나 " + email);
		
			Sns sns= snsService.selectByType("kakao");
			logger.info("sns에 들어있는 sns_idx" + sns);

			member.setSns(sns);
			member.setEmail(email);
			member.setId(id);
			member.setNickname(nickname);
			
			//회원정보없으니까 -가입시키기
 			memberService.regist(member);
 			logger.info("방금 회원인 경우의 member_idx " + member.getMember_idx());
 			
		}else {			
			
			logger.info("이미 회원인 경우의 member_idx " + member.getMember_idx());
		}
		
		//나머지는 로그인을 그냥 가면 된다.	
		session.setAttribute("member", member);
		ModelAndView mav = new ModelAndView("redirect:/");
		
		return mav;
	}
	
	//네이버 로그인 콜백
	@GetMapping("/sns/naver/callback")
	public ModelAndView NaverCallback(HttpServletRequest request, HttpSession session) {

		String code=request.getParameter("code");

		logger.info("네이버에서 발급된 코드는" + code);
		
		/* ----------------------------------------------------------------------------------- 
		 1) 토큰 취득을 위한 POST 헤더 와 바디 구성하기 ----이걸 구글에서 요구하니까, 보내줘야 이제 인증이 완료되는 것.
		 -------------------------------------------------------------------------------------- */
		String url= naverLogin.getToken_request_url();
		
		//바디의 파라미터 구성하기 <파라미터명, 파라미터 값>   
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		
		params.add("code", code);
		params.add("client_id", naverLogin.getClient_id());
		params.add("client_secret", naverLogin.getClient_secret());
		params.add("redirect_uri", naverLogin.getRedirect_uri());
		params.add("grant_type", naverLogin.getGrant_type());
		
		//post 방식의 헤더 (application/x-www-form-urlencoded)
		HttpHeaders headers = new HttpHeaders();
		headers.add("Contet-Type", "application/x-www-form-urlencoded");
		
		//머리와 몸 합치기
		HttpEntity httpEntity = new HttpEntity(params, headers);

		//요청 시도를 위한 객체 생성, 비동기방식의 요청을 위한 객체
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, httpEntity, String.class);
		
		logger.info("네이버에서 넘겨받은 응답정보 "+ responseEntity); 
		
	
		/* ----------------------------------------------------------------------------------- 
		 2) 토큰 요청 후, ResponseEntity 로부터 토큰 꺼내기(String에 불과하므로...)
		 -------------------------------------------------------------------------------------- */
		String body = responseEntity.getBody();
		logger.info("네이버에서 넘겨받은 응답정보" + body);
		
		
		//json으로 되어있는 문자열을 파싱하여, 자바의 객체에 옮겨담자
		ObjectMapper objectMapper = new ObjectMapper();
		NaverOAuthToken naverAuthToken = null;

		try {
			naverAuthToken = objectMapper.readValue(body, NaverOAuthToken.class);
			
			
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	
		 
		/* ----------------------------------------------------------------------------------- 
		 3) 토큰을 이용하여, 회원정보에 접근 (3사가 모두 똑같음, 여기는 표준)
		 -------------------------------------------------------------------------------------- */		
		 String userinfo_url =naverLogin.getUserinfo_url();
		
		//Get 방식 요청 구성
		HttpHeaders headers2 = new HttpHeaders();
												//Bearer(한칸 뛰고) + 위의 토큰을 담는다.
		headers2.add("Authorization", "Bearer "+naverAuthToken.getAccess_token());
		HttpEntity entity = new HttpEntity(headers2);
		
		//비동기 객체를 이요한 get 요청
		RestTemplate restTemplate2 = new RestTemplate();
		ResponseEntity<String> userEntity = restTemplate2.exchange(userinfo_url, HttpMethod.GET, entity, String.class);
		
		String userBody =  userEntity.getBody();
		logger.info("회원정보는 "+ userBody);
		
		
		//키값, 유저 정보(String 이 아닌값도 포함할 수 있도록 오브젝트)
		HashMap<String, Object> userMap=new HashMap<String, Object>();
		//사용자 정보 추출하기
		ObjectMapper objectMapper2 = new ObjectMapper();
		 try {
			userMap = objectMapper2.readValue(userBody, HashMap.class);
			
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		

		//내부의 json은 맵으로 처리
		Map response=(Map)userMap.get("response");
		String id = (String)response.get("id");
		//String em = (String)response.get("email");
		String nickname = (String)response.get("name");
		//String mobile = (String)response.get("mobile");
		
		logger.info("id" + id);
		logger.info("nickname is " + nickname);

		//logger.info("mobile is " + mobile);


		//멤버에 대한 고유 id 조회 -- dao
		Member member = memberService.selectById(id);
		
		//회원정보가 없다면 회원가입  --- 로그인은 
		if(member==null) {
		//이미 디비에 이 회원의 식별고유 id가 존재할 경우
		//로그인을 처리해주자 (서비스의 regist 후 세션에 담자)
			//snsservice를 만들어야 함
			
			member = new Member();
			
			Email email = new Email();
			email.setEmailaddr((String)response.get("email"));
			
			Phone phone = new Phone();
			phone.setPhoneNumber((String)response.get("mobile"));

			Sns sns= snsService.selectByType("naver");
			logger.info("sns에 들어있는 sns_idx" + sns);

			member.setSns(sns);
			member.setEmail(email);
			member.setPhone(phone);
			member.setId(id);
			member.setNickname(nickname);
			
			//회원정보없으니까 -가입시키기
 			memberService.regist(member);
 			logger.info("방금 회원인 경우의 member_idx " + member.getMember_idx());
		}else{			
			logger.info("이미 회원인 경우의 member_idx " + member.getMember_idx());
		}
		
		
		//나머지는 로그인을 그냥 가면 된다.	
		session.setAttribute("member", member);
		ModelAndView mav = new ModelAndView("redirect:/");
		
		return mav;
	}
	
	
}
