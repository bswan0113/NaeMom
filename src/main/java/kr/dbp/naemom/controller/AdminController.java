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
	
}