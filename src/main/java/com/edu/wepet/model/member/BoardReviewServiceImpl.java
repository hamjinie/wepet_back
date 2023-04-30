package com.edu.wepet.model.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.edu.wepet.domain.BoardReview;

@Service
public class BoardReviewServiceImpl implements BoardReviewService{

	@Autowired
	@Qualifier("mybatisBoardReviewDAO")
	private BoardReviewDAO boardReviewDAO;
	
	public List selectAll() {
		return boardReviewDAO.selectAll();
	}

	public void insert(Map map) {
		boardReviewDAO.insert(map);
	}

}
