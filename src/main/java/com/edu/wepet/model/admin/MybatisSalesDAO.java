package com.edu.wepet.model.admin;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.wepet.domain.Sales;
import com.edu.wepet.exception.SalesException;

@Repository
public class MybatisSalesDAO implements SalesDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List selectSum() {
		return sqlSessionTemplate.selectList("Sales.selectSum");
	}

	@Override
	public List selectByStat(int status) {
		return sqlSessionTemplate.selectList("Sales.selectByStat", status);
	}

	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Sales.selectAll");
	}

	@Override
	public List selectByCase(int status) {
		return sqlSessionTemplate.selectList("Sales.selectByCase", status);
	}

	@Override
	public void update(Map map) throws SalesException{
		int result=sqlSessionTemplate.update("Sales.update", map);
//		System.out.println("result : "+map);
		if(result<1) {
			throw new SalesException("수정 실패");
		}

	}
	

}
