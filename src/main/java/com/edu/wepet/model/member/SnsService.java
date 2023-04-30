package com.edu.wepet.model.member;

import java.util.List;

import com.edu.wepet.domain.Sns;

public interface SnsService {
	

	public Sns selectByMember(int sns_idx);
	public Sns selectByType(String sns_type);
	

}
