package com.edu.wepet.model.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.wepet.domain.Member;
import com.edu.wepet.domain.Phone;
import com.edu.wepet.exception.PhoneException;

@Repository
public class MybatisPhoneDAO implements PhoneDAO {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;


	public Phone selectByPhone(Phone phone) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("Phone.selectByPhone", phone);
	}

	@Override
	public Phone selectByMember(Member member) {
		return sqlSessionTemplate.selectOne("Phone.selectByMember", member);
	}
	
	@Override
	public Phone select(int member_idx) {
		return sqlSessionTemplate.selectOne("Phone.select", member_idx);
	}
	

	@Override
	public void insert(Phone phone) throws PhoneException {
		int result = sqlSessionTemplate.insert("Phone.insert", phone);

		if (result < 1) {
			throw new PhoneException("phone 입력 실패");
		}
	}

}
