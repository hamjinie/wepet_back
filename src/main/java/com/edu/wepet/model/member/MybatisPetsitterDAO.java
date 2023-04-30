package com.edu.wepet.model.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.wepet.domain.PetSitter;
import com.edu.wepet.exception.PetsitterException;
import com.edu.wepet.exception.PhoneException;

@Repository
public class MybatisPetsitterDAO implements PetsitterDAO{

	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;
	
	@Override
	public List selectAll() {
		return SqlSessionTemplate.selectList("PetSitter.selectAll");
	}
	
	@Override
	public void update(PetSitter petSitter) throws PetsitterException {
		int result = SqlSessionTemplate.update("PetSitter.update", petSitter);
		
		if(result <1) {
			throw new PetsitterException("petsitter 수정실패");
		}
	}

	@Override
	public void insert(PetSitter petSitter) throws PetsitterException {
		int result = SqlSessionTemplate.insert("PetSitter.insert", petSitter);
		
		if(result<1) {
			throw new PetsitterException("petsitter 입력 실패");
		}
		
	}

	

}
