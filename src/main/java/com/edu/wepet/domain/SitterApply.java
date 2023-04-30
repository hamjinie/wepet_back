package com.edu.wepet.domain;

import lombok.Data;

@Data
public class SitterApply {
	private int sitter_apply_idx;
	private String apply_type; 		// 접수 / 반려 / 승인
 	
}
