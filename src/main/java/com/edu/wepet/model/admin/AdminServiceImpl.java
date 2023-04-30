package com.edu.wepet.model.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.wepet.domain.Admin;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public Admin select(Admin admin) {
		return adminDAO.select(admin);
	}

}
