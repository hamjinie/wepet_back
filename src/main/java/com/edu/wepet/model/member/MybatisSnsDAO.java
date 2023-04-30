package com.edu.wepet.model.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.wepet.domain.Sns;

@Repository
public class MybatisSnsDAO implements SnsDAO{
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public Sns selectByMember(int sns_idx) {
		return sqlSessionTemplate.selectOne("Sns.selectByMember", sns_idx);
	}

	@Override
	public Sns selectByType(String sns_type) {
		 
			Sns sns = sqlSessionTemplate.selectOne("Sns.selectByType", sns_type);
			logger.info("dao SNS 나와라" +sns);
			
			return sns;
	}
	
}
