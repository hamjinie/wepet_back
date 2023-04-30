package com.edu.wepet.model.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.edu.wepet.domain.Member;
import com.edu.wepet.exception.MemberException;

@Repository
public class MybatisMemberDAO implements MemberDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Member.selectAll");
	}
	
	//회원인지 아닌지를 컨트롤러가서
	@Override
	public Member selectById(String id) {
		
		Member member = sqlSessionTemplate.selectOne("Member.selectById", id);
	
		return member;
	}

	
	@Override
	public Member select(int member_idx) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("Member.select", member_idx);
	}

	@Override
	public void insert(Member member) throws MemberException{
		int result=sqlSessionTemplate.insert("Member.insert", member);

		if(result<1) {
			throw new MemberException("회원등록 실패");
		}
	}
	
	@Override
	public void update(Member member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int member_idx) {
		// TODO Auto-generated method stub
		
	}

	
	
}
