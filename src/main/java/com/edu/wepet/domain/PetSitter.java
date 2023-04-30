package com.edu.wepet.domain;

import lombok.Data;

@Data
public class PetSitter {

	 private int petsitter_idx;
	 
	 private Member member; 		//fk-- 일반회원
	 private SitterApply sitterApply; 		//fk-- 인증구분(펫시터)

	 private String sitter_nickname; 	//시터 활동명(이름과 다른거)
	 
	 private String accountNum; 	//계좌번호 
	 private String bank;  		//은행
	 private String exp; 		//펫 경험유무 
	 
}
