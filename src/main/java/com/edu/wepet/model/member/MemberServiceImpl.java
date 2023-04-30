package com.edu.wepet.model.member;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.edu.wepet.domain.Member;
import com.edu.wepet.exception.EmailException;
import com.edu.wepet.exception.MemberException;
import com.edu.wepet.exception.PhoneException;

@Service
public class MemberServiceImpl implements MemberService{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private EmailDAO emailDAO;
	
	@Autowired
	private PhoneDAO phoneDAO;
	
	
	@Override
	public List selectAll() {	
		return memberDAO.selectAll();
	}

	@Override
	public Member select(int member_idx) {
		return memberDAO.select(member_idx);
	}

	@Override
	public Member selectById(String id) {
		return memberDAO.selectById(id);
	}

	
	@Transactional(propagation = Propagation.REQUIRED)
	public void regist(Member member) throws MemberException, EmailException, PhoneException{
		//이 기준 위 아래를 기점으로 큰 차이가 생김, insert 하면서, selectkey가 실행되어서
		memberDAO.insert(member);   //이 아래에서 idx가 생겨남
		
		member.getEmail().setMember(member);
		//idx를 이용해서 다른 애들한테 일시키기
		//이메일 3사 공통 / 핸드폰은 네이번만 추출가능
		
		if(member.getSns().getSns_type().equals("google")) {
			emailDAO.insert(member.getEmail());
			
		}else if(member.getSns().getSns_type().equals("kakao")) {
			emailDAO.insert(member.getEmail());
			
		}else if(member.getSns().getSns_type().equals("naver")) {

			emailDAO.insert(member.getEmail());
			
			member.getPhone().setMember(member);			
			phoneDAO.insert(member.getPhone());

		}
		
	}

	@Override
	public void update(Member member) {
		
	}

	@Override
	public void delete(int member_idx) {
		
	}


}
