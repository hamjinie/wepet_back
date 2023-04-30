package com.edu.wepet.model.member;

import com.edu.wepet.domain.Email;
import com.edu.wepet.domain.Member;

public interface EmailDAO {

	public Email select(int email_idx);
	public Email selectByMember(Member member);
	public void insert(Email email);
}
