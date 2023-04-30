package com.edu.wepet.model.member;

import com.edu.wepet.domain.Email;
import com.edu.wepet.domain.Member;

public interface EmailService {

	public Email select(int eamil_idx);
	public Email selectByMember(Member member);
	public void insert(Email email);
}
