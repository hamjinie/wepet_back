package com.edu.wepet.model.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.wepet.domain.SitterApply;

@Repository
public class MybatisSitterApplyDAO implements SitterApplyDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("SitterApply.selectAll");
	}

	@Override
	public SitterApply selectByPetsitter(int sitter_apply_idx) {
		return sqlSessionTemplate.selectOne("SitterApply.selectByPetsitter", sitter_apply_idx);
	}

	@Override
	public SitterApply selectByType(String apply_type) {
		return sqlSessionTemplate.selectOne("SitterApply.selectByType", apply_type);
	}

}
