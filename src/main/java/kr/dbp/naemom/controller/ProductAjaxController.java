package kr.dbp.naemom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.pagination.PageMaker;
import kr.dbp.naemom.service.ProductService;
import kr.dbp.naemom.service.ReviewService;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.ReviewVO;


@RestController
public class ProductAjaxController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping(value = "/product/like/{pd_num}/{li_state}", method=RequestMethod.GET)
	public Map<String, Object> likeUpdate(
			@PathVariable("pd_num")int pd_num, @PathVariable("li_state")int li_state,
			HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		Map<String, Object> map = new HashMap<String, Object>();
		int res =productService.likeUpdate(user.getMe_id(),pd_num,li_state);
		map.put("res", res);
		return map;
	}
	
	@RequestMapping(value="/review/list/{pd_num}", method=RequestMethod.POST)
	public Map<String, Object> reviewList(@RequestBody Criteria cri,
		@PathVariable("pd_num")int pd_num){
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(cri);
		System.out.println(pd_num);
		
		ArrayList<ReviewVO> list = reviewService.getReviewList(pd_num, cri);
		map.put("list", list);
		//페이지메이커를 생성
		int totalCount = reviewService.getTotalCountReviewList(pd_num);
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		map.put("pm", pm);
		return map;
	}

	@RequestMapping(value="/review/insert", method=RequestMethod.POST)
	public  Map<String, Object> commentInsert(@RequestBody ReviewVO review, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		int resReview = reviewService.insertReview(review);
		map.put("re_num", resReview);
		map.put("re_pd_num", review.getRe_pd_num());
		return  map;
	}
	@RequestMapping(value="/review/insert/file/{re_num}/{re_pd_num}", method=RequestMethod.POST)
	public  Map<String, Object> commentInsertFile(@RequestBody MultipartFile[] uploadFile, 
			@PathVariable("re_num")int re_num, 
			@PathVariable("re_pd_num") int re_pd_num){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res= reviewService.insertReviewFile(re_num,re_pd_num, uploadFile);
		map.put("res", res);
		return map;
	}
}
