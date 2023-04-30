package com.edu.wepet.model.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.wepet.domain.Email;
import com.edu.wepet.domain.Member;
import com.edu.wepet.exception.EmailException;
import com.edu.wepet.exception.MemberException;

@Service
public class EmailServiceImpl implements EmailService{

	@Autowired
	private EmailDAO emailDAO;
	
	
	@Override
	public Email select(int eamil_idx) {
		return emailDAO.select(eamil_idx);
	}

	@Override
	public Email selectByMember(Member member) {
		return emailDAO.selectByMember(member);
	}

	@Override
	public void insert(Email email) throws EmailException{
		emailDAO.insert(email);
		
	}

}
