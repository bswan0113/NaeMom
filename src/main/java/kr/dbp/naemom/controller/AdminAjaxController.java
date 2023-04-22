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
import kr.dbp.naemom.vo.BuyListVO;
import kr.dbp.naemom.vo.CourseVO;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.ReportManageVO;
import kr.dbp.naemom.vo.ReviewCommentVO;
import kr.dbp.naemom.vo.ReviewVO;

@RestController
public class AdminAjaxController {
	
	@Autowired
	AdminService adminService;
	
	
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
	    ArrayList<BuyListVO> buyList = adminService.getBuyList(id,cri);

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
		if(type.equals("댓글")) {
			count = adminService.getReCount(id);
			ArrayList<ReviewVO> ob = adminService.getReList(id, cri);
			PageMaker pm = new PageMaker(count, 5, cri);
			map.put("pm", pm);
			map.put("ob", ob);
			
		}
		if(type.equals("리뷰")) {
			count = adminService.getRcCount(id);
			ArrayList<ReviewCommentVO> ob = adminService.getRcList(id, cri);
			PageMaker pm = new PageMaker(count, 5, cri);
			map.put("pm", pm);
			map.put("ob", ob);
			
		}
		if(type.equals("코스")) {
			count = adminService.getCoCount(id);
			ArrayList<CourseVO> ob = adminService.getCoList(id, cri);
			PageMaker pm = new PageMaker(count, 5, cri);
			map.put("pm", pm);
			map.put("ob", ob);
			
		}
		return map;
	}
		
	
	

	
}
