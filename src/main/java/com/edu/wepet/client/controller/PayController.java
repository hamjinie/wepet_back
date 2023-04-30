package com.edu.wepet.client.controller;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Base64;
import java.util.Base64.Encoder;

import javax.servlet.http.HttpServletRequest;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edu.wepet.domain.BoardReview;
import com.edu.wepet.model.member.BoardReviewService;

@Controller
public class PayController {
	
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private BoardReviewService boardReviewService;
		
	@GetMapping("/regist")
    public ModelAndView getRegistForm() {
        return new ModelAndView("wepet/client/regist_review");
    }	
	
	@PostMapping("/pay")
	public ModelAndView getPay() {			
		return new ModelAndView("wepet/client/pay");
	}	
		
	@RequestMapping(value = "/payment/callback/success", method = RequestMethod.GET)
	public ModelAndView Payment(HttpServletRequest httpServletRequest, String paymentKey, String orderId, int amount) {
		logger.info("결제요청 성공");
		
		
		//결제승인 요청(post방식으로 승인을 요청해야 한다.)
		HttpRequest req = HttpRequest.newBuilder()
			    .uri(URI.create("https://api.tosspayments.com/v1/payments/confirm"))
			    .header("Authorization", "Basic dGVzdF9za19ZWjFhT3dYN0s4bTYwUlB3N3FxM3lReHp2TlBHOg==")
			    .header("Content-Type", "application/json")
			    .method("POST", HttpRequest.BodyPublishers.ofString("{\"paymentKey\":\""+paymentKey+"\",\"amount\":"+amount+",\"orderId\":\""+orderId+"\"}"))
			    .build();
			try {
				HttpResponse<String> response = HttpClient.newHttpClient().send(req, HttpResponse.BodyHandlers.ofString());
				logger.info("결제 승인 요청 결과"+response.body());
			} catch (Exception e) {
				e.printStackTrace();
			}
		
			//1 주문요약 ordersummary insert, pk를 selectkey로 얻어와, orderdetail에 적용해야함			
			
			//2 주문상세 orderdetail (2건 이상일 경우 반복문으로 태랜잭션 걸어서)
			//장바구니에 들어있는 상품만큼 반복문 돌린다.
			
			//3 장바구니 테이블 비우기 (delete)
			
			//4 이메일전송, 문자전송, 카톡메시지 전송
			
			//5 결제결과
			
			
		return new ModelAndView("wepet/client/success");		
	}
	
	@PostMapping("/fail")
	public String failUrl() {
		return "wepet/client/fail";
	}
	
	
}
