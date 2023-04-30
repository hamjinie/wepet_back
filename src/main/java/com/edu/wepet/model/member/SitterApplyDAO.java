package com.edu.wepet.model.member;

import java.util.List;

import com.edu.wepet.domain.SitterApply;

public interface SitterApplyDAO {
	public List selectAll();
	public SitterApply selectByPetsitter(int sitter_apply_idx);
	
	public SitterApply selectByType(String apply_type);

}
