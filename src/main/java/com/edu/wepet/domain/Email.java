package com.edu.wepet.domain;

import lombok.Data;

@Data
public class Email {
	
	private int email_idx;
	private Member member; 	//fk

	private String emailaddr;
	

}
