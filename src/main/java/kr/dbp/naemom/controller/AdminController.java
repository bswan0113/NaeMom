package kr.dbp.naemom.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.pagination.PageMaker;
import kr.dbp.naemom.service.AdminService;
import kr.dbp.naemom.vo.qnaVO;


@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	
	@RequestMapping(value = "/admin/list/qnaList")
	public ModelAndView course(ModelAndView mv, Criteria cri) {
		
		ArrayList<qnaVO> qList = adminService.getQList(cri);
		int totalCount = adminService.getCountQList();
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		
		mv.addObject("qnaList", qList);
		mv.addObject("pm", pm);
		mv.setViewName("/admin/list/qnaList");
		return mv;
	}
	
}