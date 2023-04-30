package com.edu.wepet.model.member;

import java.util.List;

import com.edu.wepet.domain.Member;


public interface MemberService {
	public List selectAll();
	public Member select(int member_idx);
	public Member selectById(String id);
	public void regist(Member member); 		//회원가입..
	public void update(Member member);
	public void delete(int member_idx);

}
