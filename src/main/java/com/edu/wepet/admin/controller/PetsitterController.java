package com.edu.wepet.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.wepet.domain.Member;
import com.edu.wepet.domain.PetSitter;
import com.edu.wepet.domain.SitterApply;
import com.edu.wepet.model.member.PetsitterService;
import com.edu.wepet.model.member.SitterApplyService;

@Controller
public class PetsitterController {
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PetsitterService petsitterService;
	
	@Autowired
	private SitterApplyService sitterApplyService;
	
	//펫시터 회원리스트 조회
	@GetMapping("/petsitter/list")
	public ModelAndView getPetsitterList(HttpServletRequest request) {
		
		List  applyList=sitterApplyService.selectAll();		
		List<PetSitter> petsitterList = petsitterService.selectAll();
		
		ModelAndView mav= new ModelAndView("wepet/admin/user/sitter_list");
		mav.addObject("applyList", applyList);//승인, 반려 버튼을 출력하기 위한 리스트
		mav.addObject("petsitterList", petsitterList); //테이블 목록 
		
		return mav;
	}
	
	@PostMapping("/petsitter/apply")
	public ModelAndView apply(HttpServletRequest request,  int[] member_idx, PetSitter petSitter) {

		
		logger.info("petSitter is "+ petSitter.getPetsitter_idx());
		logger.info("member_idx is "+ member_idx);
		
		PetSitter[] petSitters =new PetSitter[member_idx.length];
			for(int i=0; i<petSitters.length; i++) {
				
				PetSitter sitter = new PetSitter();
				Member member =new Member();
				
				SitterApply sitterApply=petSitter.getSitterApply();
				member.setMember_idx(member_idx[i]);
				sitter.setMember(member);
				sitter.setSitterApply(sitterApply);			
				
				logger.info("sitter "+ sitter);
				petSitters[i]=sitter;		
			}
			
		petsitterService.update(petSitters);
			
		ModelAndView mav = new ModelAndView("redirect:/admin/main");
		
		return mav;
	}
	
	
	
}
