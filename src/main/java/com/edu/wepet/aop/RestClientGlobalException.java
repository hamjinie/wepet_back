package com.edu.wepet.aop;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.edu.wepet.exception.MemberException;
import com.edu.wepet.util.Message;

/*관리자와 관련된 글로벌 예외처리 객체 
 * 단 응답형식은 jsp가 아닌  json 과 같은 데이터형태가 되어야 하므로, 
 * ResponseEntity로 응답한다 */

//RestControllerAdvice = ControllerAdvice + @ResponseBody
//RestControllerAdvice(annotations=RestController.class) = RestController 에서
//발생한 예외만 잡는다.
@RestControllerAdvice(annotations = RestController.class)  
public class RestClientGlobalException {
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@ExceptionHandler(MemberException.class)
	public ResponseEntity<Message> handle(RuntimeException e){
		logger.info("client Rest 글로벌 예외에서 감지한 회원등록 실패");
		
		Message message = new Message();
		message.setMsg("Admin Rest 글로벌 예외:"+e.getMessage());
		
		ResponseEntity entity=new ResponseEntity<Message>(message, HttpStatus.INTERNAL_SERVER_ERROR);
		
		return entity;
	}

}





