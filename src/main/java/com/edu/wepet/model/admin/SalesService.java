package com.edu.wepet.model.admin;

import java.util.List;
import java.util.Map;

public interface SalesService {

	public List selectSum();
	public List selectByStat(int status);
	public List selectAll();
	public List selectByCase(int status);
	public void update(Map map);


}
