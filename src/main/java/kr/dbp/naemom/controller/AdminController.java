package kr.dbp.naemom.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.pagination.PageMaker;
import kr.dbp.naemom.service.AdminService;
import kr.dbp.naemom.vo.Buy_listVO;
import kr.dbp.naemom.vo.CourseVO;
import kr.dbp.naemom.vo.Hash_tagVO;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.ReviewCommentVO;
import kr.dbp.naemom.vo.ReviewVO;
import kr.dbp.naemom.vo.qnaVO;
import kr.dbp.naemom.vo.qna_AnswerVO;


@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	

	@RequestMapping(value = "/admin/list/qnaList")
	public ModelAndView qnaList(ModelAndView mv, Criteria cri) {
		
		ArrayList<qnaVO> qList = adminService.getQList(cri);
		int totalCount = adminService.getCountQList();
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		
		mv.addObject("qnaList", qList);
		mv.addObject("pm", pm);
		mv.setViewName("/admin/list/qnaList");
		return mv;
	}

	@RequestMapping(value = "/admin/list/qnaAnswer/{qa_num}", method = RequestMethod.GET)
	public ModelAndView qnaAnswer(ModelAndView mv, @PathVariable("qa_num")int qa_num) {
		qnaVO qna = adminService.getQnaByNum(qa_num);
		mv.addObject("qna", qna);
		mv.setViewName("/admin/list/qnaAnswer");
		return mv;
	}
	
	@RequestMapping(value = "/admin/list/qnaAnswer", method = RequestMethod.POST)
	public ModelAndView qnaAnswerPost(ModelAndView mv, qna_AnswerVO answer) {
		boolean res = adminService.insertAnswer(answer);
		if(res) {
			
			mv.setViewName("redirect:/admin/list/qnaList");
		}else {
			mv.setViewName("redirect:/admin/list/qnaAnswer/"+answer.getQaa_qa_num());
		}
		return mv;
	}

	@RequestMapping(value = "/admin/list/reportList")
	public ModelAndView reportList(ModelAndView mv) {
		ArrayList<ReviewCommentVO> rcl = adminService.getReportedRc();
		ArrayList<ReviewVO> rel = adminService.getReportedRe();
		ArrayList<CourseVO> col = adminService.getReportedCo();

		mv.addObject("col", col);
		mv.addObject("rcl", rcl);
		mv.addObject("rel", rel);
		mv.setViewName("/admin/list/reportList");
		return mv;
	}
	
	@RequestMapping(value = "/admin/list/userList")
	public ModelAndView userList(ModelAndView mv, Criteria cri) {
		if(cri==null) cri = new Criteria();
		int totalCount = adminService.getUserCount();
		PageMaker pm = new PageMaker(totalCount, 10, cri);
		ArrayList<MemberVO> userList = adminService.getUserList(cri);
		
		mv.addObject("ul", userList);
		mv.addObject("pm", pm);
		mv.setViewName("/admin/list/userList");
		return mv;
	}
	

	@RequestMapping(value = "/mypage/profile/{me_id}", method = RequestMethod.GET)
	public ModelAndView adminIntoUserPage(ModelAndView mv,	@PathVariable("me_id")String me_id) {
		MemberVO user = adminService.getUserInfo(me_id);
		mv.addObject("user",user);
		mv.setViewName("/mypage/profile");
		return mv;
		
	}
	
	@RequestMapping(value = "/admin/insert/hashtag/{pd_num}/{pd_title}")
	public ModelAndView adminIntoUserPage(ModelAndView mv, @PathVariable("pd_num")int pd_num, @PathVariable("pd_title")String pd_title) {
		ArrayList<Hash_tagVO> regi = adminService.getHashList(pd_num);
		
		mv.addObject("pd_num", pd_num);
		mv.addObject("title", pd_title);
		mv.addObject("regi", regi);
		mv.setViewName("/admin/insert/insertHashtag");
		return mv;
		
	}
	
	
	@RequestMapping(value = "/admin/list/buyCancelList")
	public ModelAndView buyCancelList(ModelAndView mv, Criteria cri) {
		if(cri==null) cri = new Criteria();
		ArrayList<Buy_listVO> list = adminService.getAllBuyList(cri);
		int totalCount = adminService.getBuyListCount();
		PageMaker pm = new PageMaker(totalCount, 10, cri);
		mv.addObject("list", list);
		mv.addObject("pm", pm);
		mv.setViewName("/admin/list/buyCancelList");
		return mv;
	}
}