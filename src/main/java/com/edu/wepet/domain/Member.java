package com.edu.wepet.domain;

import java.util.List;

import lombok.Data;

@Data
public class Member {

	private int member_idx;
	private Sns sns; 		//fk
	private String id; 		//고유아이디
	private String nickname;
	private String regdate; 		//가입일

	//이메일, 핸드폰... 보유하기로하고
	private Email email;
	private Phone phone;
	
	private PetSitter petSitter;
}
