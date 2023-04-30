package com.edu.wepet.model.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.wepet.domain.Member;
import com.edu.wepet.domain.Phone;
import com.edu.wepet.exception.PhoneException;

@Service
public class PhoneServiceImpl implements PhoneService {

	@Autowired
	 private PhoneDAO phoneDAO;
	 
	@Override
	public Phone select(int member_idx) {
		return phoneDAO.select(member_idx);
	}
	@Override
	public Phone selectByPhone(Phone phone) {
		return phoneDAO.selectByPhone(phone);
	}

	@Override
	public Phone selectByMember(Member member) {
		return phoneDAO.selectByMember(member);
	}

	@Override
	public void insert(Phone phone) throws PhoneException{
		phoneDAO.insert(phone);
	}


	
}
