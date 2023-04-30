package com.edu.wepet.domain;

import lombok.Data;

@Data
public class Phone {
	
	private int phone_idx;
	private Member member; 		//fk

	private String phoneNumber;

}
