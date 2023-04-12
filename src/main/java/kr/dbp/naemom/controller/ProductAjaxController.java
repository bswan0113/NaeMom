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
import kr.dbp.naemom.vo.LikeVO;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.ReportVO;
import kr.dbp.naemom.vo.ReviewCommentVO;
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
	
	@RequestMapping(value="/admin/delete/product", method=RequestMethod.POST)
	public  Map<String, Object> deleteProduct(@RequestBody int number){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res= productService.deleteProduct(number);
		map.put("res", res);
		return  map;
	}
	@RequestMapping(value="/review/insert/file/{re_num}", method=RequestMethod.POST)
	public  Map<String, Object> commentInsertFile(@RequestBody MultipartFile[] uploadFile, 
			@PathVariable("re_num")int re_num){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res= reviewService.insertReviewFile(re_num, uploadFile);
		map.put("res", res);
		return map;
	}
	@RequestMapping(value="/review/delete", method=RequestMethod.POST)
	public  Map<String, Object> commentInsertFile(@RequestBody ReviewVO review, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res= reviewService.deleteReview("abcd", review);
		map.put("res", res);
		return map;
	}
	
	@RequestMapping(value="/review/comment/list/{rc_re_num}", method=RequestMethod.POST)
	public Map<String, Object> reviewCommentList(@RequestBody Criteria cri,
		@PathVariable("rc_re_num")int rc_re_num){
		Map<String, Object> map = new HashMap<String, Object>();
		cri.setRc_re_num(rc_re_num);
		ArrayList<ReviewCommentVO> rCList = reviewService.getRCommentList(rc_re_num, cri);
		map.put("rCList",rCList);
		int commentTotalCount = reviewService.getTotalCountReviewCommentList(rc_re_num);
		PageMaker rCPm = new PageMaker(commentTotalCount, 5, cri);
		map.put("rCPm", rCPm);
		return map;
	}	

	@RequestMapping(value="/review/comment/insert", method=RequestMethod.POST)
	public Map<String, Object> reviewCommentInsert(@RequestBody ReviewCommentVO reviewComment, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = new MemberVO();
		user.setMe_id("abcd");
		boolean res= reviewService.insertReviewComment(reviewComment, user.getMe_id());
		map.put("res", res);
		return map;
	}	
	@RequestMapping(value="/review/comment/delete", method=RequestMethod.POST)
	public Map<String, Object> reviewCommentDelete(@RequestBody ReviewCommentVO reviewComment, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = new MemberVO();
		user.setMe_id("abcd");
		boolean res= reviewService.deleteReviewComment(reviewComment, user.getMe_id());
		map.put("res", res);
		return map;
	}	

	@RequestMapping(value="/review/report", method=RequestMethod.POST)
	public Map<String, Object> reportReview(@RequestBody ReportVO report, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = new MemberVO();
		user.setMe_id("abcd");
		boolean res= reviewService.reportReview(report,user);
		map.put("res", res);
		return map;
	}
	@RequestMapping(value="/comment/report", method=RequestMethod.POST)
	public Map<String, Object> reportComment(@RequestBody ReportVO report, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = new MemberVO();
		user.setMe_id("abcd");
		boolean res= reviewService.reportComment(report,user);
		map.put("res", res);
		return map;
	}	
	
	@RequestMapping(value="/check/report", method=RequestMethod.POST)
	public Map<String, Object> checkReport(@RequestBody ReportVO report, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = new MemberVO();
		boolean res = reviewService.checkReportById(report);
		map.put("res", res);
		return map;
	}	
	@RequestMapping(value="/review/like", method=RequestMethod.POST)
	public Map<String, Object> likeReview(@RequestBody LikeVO like, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = new MemberVO();
		user.setMe_id("abcd");
		like.setLi_me_id(user.getMe_id());
		boolean res= reviewService.insertReviewLike(like);
		map.put("res", res);
		return map;
	}
	@RequestMapping(value="/view/userLike", method=RequestMethod.POST)
	public Map<String, Object> userLikeView(@RequestBody ReviewVO review, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = new MemberVO();
		user.setMe_id("abcd");
		review.setRe_me_id(user.getMe_id());
		int like =reviewService.getLike(review);
		map.put("like", like);
		return map;
	}
	@RequestMapping(value="/view/like", method=RequestMethod.POST)
	public Map<String, Object> viewLike(@RequestBody Integer re_num, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = new MemberVO();
		user.setMe_id("abcd");
		int like= reviewService.getLikeCount(re_num);
		int dislike= reviewService.getDislikeCount(re_num);
		map.put("dislike", dislike);
		map.put("like", like);
		return map;
	}	
	
	@RequestMapping(value="/review/update", method=RequestMethod.POST)
	public Map<String, Object> updateReview(@RequestBody ReviewVO review, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = new MemberVO();
		user.setMe_id("abcd");
		review.setRe_me_id(user.getMe_id());
		boolean res= reviewService.updateReview(review);
		map.put("res", res);
		map.put("table_key", review.getRe_num());
		return map;
	}
	
	@RequestMapping(value="/review/update/file/{table_key}", method=RequestMethod.POST)
	public  Map<String, Object> updateFile(@RequestBody MultipartFile[] uploadFile, 
			@PathVariable("table_key")int table_key){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res= reviewService.updateReviewFile(uploadFile, table_key);		
		map.put("res", res);
		return map;
	}
	
	@RequestMapping(value="/like/delete", method=RequestMethod.POST)
	public Map<String, Object> likeDelete(@RequestBody LikeVO like, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = new MemberVO();
		user.setMe_id("abcd");
		like.setLi_me_id(user.getMe_id());
		boolean res= reviewService.deleteReviewLike(like);
		map.put("res", res);
		return map;
	}

	@RequestMapping(value="/admin/update/ThumbNail/{fi_num}", method=RequestMethod.POST)
	public  Map<String, Object> updateThumbNail(@RequestBody MultipartFile uploadFile, 
			@PathVariable("fi_num")int fi_num){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res= productService.updateThumbnail(uploadFile, fi_num);	
		map.put("res", res);
		return map;
	}
	@RequestMapping(value="/admin/delete/file/{fi_num}", method=RequestMethod.GET)
	public  Map<String, Object> deleteFile(
			@PathVariable("fi_num")int fi_num){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res= productService.deleteFile(fi_num);	
		map.put("res", res);
		return map;
	}
	 @RequestMapping(value="/admin/update/productFile/{pd_num}", method=RequestMethod.POST)
	  public Map<String, Object> updateProductFile(@RequestBody MultipartFile[] files, @PathVariable("pd_num")int pd_num) {
		 Map<String, Object> map = new HashMap<String, Object>();
		 boolean res = productService.updateProductFiles(files,pd_num);
		 map.put("res", res);
		 
	      return map;
	 }
}
