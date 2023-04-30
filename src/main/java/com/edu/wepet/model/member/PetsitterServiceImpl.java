package com.edu.wepet.model.member;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.edu.wepet.domain.PetSitter;
import com.edu.wepet.domain.SitterApply;
import com.edu.wepet.exception.PetsitterException;

@Service
public class PetsitterServiceImpl implements PetsitterService{

	@Autowired
	private PetsitterDAO petsitterDAO;
	
	@Autowired
	private SitterApplyDAO sitterApplyDAO;
	
	
	@Override
	public List selectAll() {
		return petsitterDAO.selectAll();
	}

	@Override
	public void regist(PetSitter petSitter) throws PetsitterException{
		
		//승인 상태 가져오기(반려 / 승인)
		//일단 펫시터 신청이 들어오면 무조건 기본값은 대기, idx 는 수정 여부가 있을 수 있으니 
		//스트링으로 고정
		
		SitterApply sitterApply=sitterApplyDAO.selectByType("대기"); 	
		
		//sitterapply 채워주기 
		petSitter.setSitterApply(sitterApply);
		
		//펫시터 등록
		petsitterDAO.insert(petSitter);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void update(PetSitter[] petSitters) throws PetsitterException{
		
		for(int i=0; i<petSitters.length; i++) {			
			petsitterDAO.update(petSitters[i]);
		}
		 
	}

}
