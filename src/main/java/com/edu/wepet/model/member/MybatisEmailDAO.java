package com.edu.wepet.model.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.wepet.domain.Email;
import com.edu.wepet.domain.Member;
import com.edu.wepet.exception.EmailException;
import com.edu.wepet.exception.MemberException;

@Repository
public class MybatisEmailDAO implements EmailDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public Email select(int email_idx) {
		return sqlSessionTemplate.selectOne("Email.select", email_idx);
	}

	@Override
	public Email selectByMember(Member member) {
		return sqlSessionTemplate.selectOne("Email.selectByMember", member);
	}

	@Override
	public void insert(Email email) throws EmailException{
		int result=sqlSessionTemplate.insert("Email.insert", email);

		if(result<1) {
			throw new MemberException("이메일등록 실패");
		}
	}


	
}
