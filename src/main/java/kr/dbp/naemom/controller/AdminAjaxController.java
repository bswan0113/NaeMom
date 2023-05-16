package kr.dbp.naemom.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.pagination.PageMaker;
import kr.dbp.naemom.service.AdminService;
import kr.dbp.naemom.service.ProductService;
import kr.dbp.naemom.utils.UseGPT;
import kr.dbp.naemom.vo.Buy_listVO;
import kr.dbp.naemom.vo.CourseVO;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.ProductVO;
import kr.dbp.naemom.vo.ReportManageVO;
import kr.dbp.naemom.vo.ReportVO;
import kr.dbp.naemom.vo.ReviewCommentVO;
import kr.dbp.naemom.vo.ReviewVO;
import kr.dbp.naemom.vo.qnaVO;

@RestController
public class AdminAjaxController {
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	ProductService productService;
	

	@RequestMapping(value = "/admin/resetPw/{id}", method=RequestMethod.GET)
	public Map<String, Object> pwCheck(@PathVariable("id") String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean res= adminService.resetPw(id);
		map.put("res", res);

		return map;
	}
	
	@RequestMapping(value = "/admin/preventUser", method=RequestMethod.POST)
	public Map<String, Object> preventUser(@RequestBody MemberVO user) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res= adminService.preventUser(user);
		map.put("res", res);

		return map;
	}
	


	@RequestMapping(value = "/admin/getReportList/{id}/{page}", method=RequestMethod.GET)
	public Map<String, Object> getReportList(@PathVariable("id") String id, @PathVariable("page")String page) {
		Map<String, Object> map = new HashMap<String, Object>();
		Criteria cri = new Criteria();   
		int pageNum = Integer.parseInt(page);
	    cri.setPage(pageNum);
	    cri.setPerPageNum(1);
	    ArrayList<ReportManageVO> report = adminService.getReportList(id,cri);

		int totalCount = adminService.getReportCount(id);
	    PageMaker pm = new PageMaker(totalCount,5,cri);
	    map.put("pm", pm);
		map.put("re", report);
		return map;
	}

	@RequestMapping(value = "/admin/getPaymentList/{id}/{page}", method=RequestMethod.GET)
	public Map<String, Object> getPaymentList(@PathVariable("id") String id, @PathVariable("page")String page) {
		Map<String, Object> map = new HashMap<String, Object>();
		Criteria cri = new Criteria();   
		int pageNum = Integer.parseInt(page);
	    cri.setPage(pageNum);
	    ArrayList<Buy_listVO> buyList = adminService.getBuyList(id,cri);

	    int totalCount = adminService.getPaymentCount(id);
	    PageMaker pm = new PageMaker(totalCount,5,cri);
	    map.put("pm", pm);
		map.put("bl", buyList);
		return map;
	}

	@RequestMapping(value = "/admin/getBoardList/{id}/{page}/{type}", method=RequestMethod.GET)
	public Map<String, Object> getBoardList(@PathVariable("id") String id, @PathVariable("page")String page, @PathVariable("type")String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		int count = 0;
		Criteria cri = new Criteria();
		cri.setPage(Integer.parseInt(page));
		if(type.equals("리뷰")) {
			count = adminService.getReCount(id);
			ArrayList<ReviewVO> ob = adminService.getReList(id, cri);
			PageMaker pm = new PageMaker(count, 5, cri);
			map.put("pm", pm);
			map.put("ob", ob);
			
		}
		else if(type.equals("댓글")) {
			count = adminService.getRcCount(id);
			ArrayList<ReviewCommentVO> ob = adminService.getRcList(id, cri);
			PageMaker pm = new PageMaker(count, 5, cri);
			map.put("pm", pm);
			map.put("ob", ob);
			
		}
		else if(type.equals("코스")) {
			count = adminService.getCoCount(id);
			ArrayList<CourseVO> ob = adminService.getCoList(id, cri);
			PageMaker pm = new PageMaker(count, 5, cri);
			map.put("pm", pm);
			map.put("ob", ob);
			
		}else {
			map.put("pm", null);
			map.put("ob", null);
		}
		return map;
	}
		
	@RequestMapping(value = "/admin/delete/review/{num}", method=RequestMethod.GET)
	public Map<String, Object> deleteReview(@PathVariable("num")int num) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = adminService.deleteReview(num);
		map.put("res", res);
		return map;
	}
	
	@RequestMapping(value = "/admin/delete/course/{num}", method=RequestMethod.GET)
	public Map<String, Object> deleteCourse(@PathVariable("num")int num) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = adminService.deleteCourse(num);
		map.put("res", res);


		return map;
	}
	
	@RequestMapping(value = "/admin/delete/comment/{num}", method=RequestMethod.GET)
	public Map<String, Object> deleteComment(@PathVariable("num")int num) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = adminService.deleteComment(num);
		map.put("res", res);


		return map;
	}
	
	@RequestMapping(value = "/admin/reportList/{type}/{num}", method=RequestMethod.GET)
	public Map<String, Object> getReportByType(@PathVariable("type")String type,@PathVariable("num")int num ) {
		Map<String, Object> map = new HashMap<String, Object>();
			ArrayList<ReportVO> ob = adminService.getReportByType(num, type);
			map.put("list", ob);
			
		return map;
	}

	
	@RequestMapping(value = "/admin/delete/hashtag/{num}", method=RequestMethod.GET)
	public Map<String, Object> deleteHashTag(@PathVariable("num")String num) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res= adminService.deleteHashtag(Integer.parseInt(num));
		map.put("res", res);

		return map;
	}
	
	@RequestMapping(value = "/admin/save/hashtag/{pd_num}", method=RequestMethod.POST)
	public Map<String, Object> deleteHashTag(@PathVariable("pd_num")int pd_num, @RequestBody String[] list) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = adminService.insertHashtag(pd_num,list);
		map.put("res", res);
		return map;
	}
	@RequestMapping(value = "/getSample", method=RequestMethod.POST)
	public Map<String, Object> getSampleAnswer(@RequestBody qnaVO qna) {
		Map<String, Object> map = new HashMap<String, Object>();
		ProductVO pr = productService.getProduct(qna.getQa_pd_num());
		map.put("res", UseGPT.getAnswerForAdmin(qna,pr));
		return map;
	}

}
