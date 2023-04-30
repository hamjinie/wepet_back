package com.edu.wepet.model.member;


import com.edu.wepet.domain.Member;
import com.edu.wepet.domain.Phone;

public interface PhoneService {

	public Phone select(int member_idx);
	public Phone selectByPhone(Phone phone);
	public Phone selectByMember(Member member);
	public void insert(Phone phone);
}
