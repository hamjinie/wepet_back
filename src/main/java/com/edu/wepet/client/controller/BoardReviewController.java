package com.edu.wepet.client.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Base64;
import java.util.HashMap;
import java.util.Base64.Encoder;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.edu.wepet.domain.BoardReview;
import com.edu.wepet.model.member.BoardReviewService;
import com.google.gson.JsonObject;

@Controller
public class BoardReviewController {
	
	@Autowired
	private BoardReviewService boardReviewService;
			
	@PostMapping("/registreview")
	public ModelAndView registReview(HttpServletRequest request, BoardReview boardReview) {
		//후기게시판 insert+selectKey 할거임
		System.out.println(request.getParameter("title"));
		System.out.println(request.getParameter("star"));
		System.out.println(request.getParameter("content"));
		
		String title=request.getParameter("title");
		String star=request.getParameter("star");
		
		String x=request.getParameter("content");
		int a=x.indexOf("<img");		
		String content=x.substring(3, a);
		System.out.println("content:"+content);
		
		int c=x.indexOf("fileupload/");
		String imgPath=x.substring(c+11, x.length()-10);
		System.out.println("imgPath:"+imgPath);
		
		HashMap<String, String> map=new HashMap(); 
		map.put("title", title); 
		map.put("star", star); 
		map.put("content", content); 
		map.put("imgPath", imgPath); 
		
		
		boardReviewService.insert(map);
		ModelAndView mav=new ModelAndView("redirect:/review");
		
		
		return mav;
	}	
	
	
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/summernote/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장		
			
			jsonObject.addProperty("url", "/resources/summernote/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
	@GetMapping("/review")
	public ModelAndView getReview() {
		List boardreviewList=boardReviewService.selectAll();		
		System.out.println(boardreviewList);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("wepet/client/board_review");
		mav.addObject("boardreviewList", boardreviewList);
		return mav;
	}	
	
	
}
