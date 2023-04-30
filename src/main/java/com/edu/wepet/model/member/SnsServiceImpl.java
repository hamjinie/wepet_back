package com.edu.wepet.model.member;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.wepet.domain.Sns;

@Service
public class SnsServiceImpl implements SnsService{
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SnsDAO snsDAO;

	@Override
	public Sns selectByMember(int sns_idx) {
		return snsDAO.selectByMember(sns_idx);
	}

	@Override
	public Sns selectByType(String sns_type) {
		Sns sns = snsDAO.selectByType(sns_type);
		logger.info("service SNS 나와라" +sns);
		
		return sns;
	}


}
