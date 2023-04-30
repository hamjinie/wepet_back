package com.edu.wepet.model.member;

import java.util.List;

import com.edu.wepet.domain.PetSitter;

public interface PetsitterDAO {

	public List selectAll();
	public void update(PetSitter petSitter);
	public void insert(PetSitter petSitter);
	
}
