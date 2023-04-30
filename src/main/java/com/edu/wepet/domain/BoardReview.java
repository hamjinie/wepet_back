package com.edu.wepet.domain;

import lombok.Data;

@Data
public class BoardReview {
	private int board_review_idx;
	private String title;
	private String content;
	private String imgPath;
	private int member_idx;
	private int petsitter_idx;
	private String regdate;
	private int star;

	
//	private Member member;
//	private PetSitter petSitter;
}
