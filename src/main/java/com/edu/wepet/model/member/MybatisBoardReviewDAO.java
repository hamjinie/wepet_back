package com.edu.wepet.model.member;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.wepet.domain.BoardReview;

@Repository
public class MybatisBoardReviewDAO implements BoardReviewDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List selectAll() {
		return sqlSessionTemplate.selectList("BoardReview.selectAll");
	}

	public void insert(Map map) {
		sqlSessionTemplate.insert("BoardReview.insert", map);
	}

}
