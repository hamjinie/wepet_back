package com.edu.wepet.model.member;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.wepet.domain.SitterApply;

@Service
public class SitterApplyImpl implements SitterApplyService{
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Autowired
	private SitterApplyDAO sitterApplyDAO;
	
	@Override
	public List selectAll() {
		return sitterApplyDAO.selectAll();
	}

	@Override
	public SitterApply selectByPetsitter(int sitter_apply_idx) {
		return sitterApplyDAO.selectByPetsitter(sitter_apply_idx);
	}

	@Override
	public SitterApply selectByType(String apply_type) {
		return sitterApplyDAO.selectByType(apply_type);
	}

	
}
