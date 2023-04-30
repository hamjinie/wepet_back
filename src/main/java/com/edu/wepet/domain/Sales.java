package com.edu.wepet.domain;

import lombok.Data;

@Data
public class Sales {
	private int sales_idx;
	private String regdate;
	private int earnings;
	private int gottenfee;
	private int status;

	private PetSitter petSitter;
	
}
