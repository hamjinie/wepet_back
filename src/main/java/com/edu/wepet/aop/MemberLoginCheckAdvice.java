package com.edu.wepet.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.edu.wepet.exception.MemberException;


public class MemberLoginCheckAdvice {
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	
	public Object sessionCheck(ProceedingJoinPoint joinPoint) throws MemberException, Throwable{
		Object result=null; 

		Class targetClass=joinPoint.getTarget().getClass();
		Object[] args=joinPoint.getArgs();//매개변수를 배열로 반환함..
		
		logger.info("호출하려는 타겟 클래스는 "+targetClass.getName());
		logger.info("호출하려는 타겟 메서드의 매개변수의 수는 "+args.length);
		

		HttpServletRequest request=null;
		HttpSession session=null;
		
		for(int i=0;i<args.length;i++) {
			if(args[i] instanceof HttpServletRequest) {
				request = (HttpServletRequest)args[i];
			}
		}
		
		//로그인을 체크해야 되는 경우와, 그냥 보내야 하는경우를 나눈다 
		String uri=request.getRequestURI(); 
		
		if(
			uri.equals("/") ||  				//메인폼 
			uri.equals("/member/loginform") || //로그인폼 요청시 제외 
			uri.equals("/rest/member/authform/google")||
			uri.equals("/rest/member/authform/kakao")||
			uri.equals("/rest/member/authform/naver")||
			uri.equals("/sns/google/callback") ||
			uri.equals("/sns/naver/callback") ||
			uri.equals("/sns/kakao/callback") ||
			uri.equals("/qnaboard/main") 		//고객센터 게시판 메인
			
		) {
			result=joinPoint.proceed();
			
		}else {
			//로그인이 필요한 서비스에서만 아래의 코드들이 수행되어야 한다..
			session = request.getSession();
			
			if(session.getAttribute("member")==null) {
				logger.info("aop 에 의한 로그인 체크 : 세션없슴");
				throw new MemberException("로그인이 필요한 서비스입니다");
			}else {
				result=joinPoint.proceed(); //로그인한 사람은 가던 길 가게...
			}
		}
		
		return result;
	}
	
}




