package com.edu.wepet.model.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.wepet.exception.SalesException;

@Service
public class SalesServiceImpl implements SalesService{

	@Autowired
	private SalesDAO salesDAO;

	@Override
	public List selectSum() {
		List list=salesDAO.selectSum();
		return list;
	}

	@Override
	public List selectByStat(int status) {
		List list=salesDAO.selectByStat(status);
		return list;
	}

	@Override
	public List selectAll() {
		List list=salesDAO.selectAll();
		return list;
	}

	@Override
	public List selectByCase(int status) {
		List list=salesDAO.selectByCase(status);
		return list;
	}

	@Override
	public void update(Map map) throws SalesException{
//		System.out.println("왔냐고.."+map);
		salesDAO.update(map);
	}
	

}
