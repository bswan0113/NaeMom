package kr.dbp.naemom.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.pagination.PageMaker;
import kr.dbp.naemom.service.SearchService;
import kr.dbp.naemom.vo.CalendarVO;
import kr.dbp.naemom.vo.CourseVO;
import kr.dbp.naemom.vo.ProductVO;


@Controller
public class SearchController {
	
	@Autowired
	SearchService searchService;
	
	@RequestMapping(value = "/searchList/searchMain")
	public ModelAndView searchMain(ModelAndView mv, Criteria cri) {
		if(cri == null) cri = new Criteria();
		cri.setPerPageNum(4);
		ArrayList<ProductVO> landmark = searchService.getProduct(cri,1);
		ArrayList<ProductVO> restraunt= searchService.getProduct(cri,2);
		ArrayList<ProductVO> accomodation= searchService.getProduct(cri,3);
		ArrayList<ProductVO> festival= searchService.getProduct(cri,4);
		ArrayList<CourseVO> course = searchService.getCourse(cri);
		mv.addObject("co", course);
		mv.addObject("search", cri.getSearch());
		mv.addObject("la", landmark);
		mv.addObject("re", restraunt);
		mv.addObject("ac", accomodation);
		mv.addObject("fe", festival);
		mv.setViewName("/searchList/searchMain");
		return mv;
	}


	@RequestMapping(value = "/searchList/searchDetailList")
	public ModelAndView searchRe(ModelAndView mv, Criteria cri) {
		if(cri == null) cri = new Criteria();
		ArrayList<ProductVO> pList =  searchService.getProduct(cri, cri.getPc_category());
		int totalCount = searchService.getTotalCount(cri.getPc_category());
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		mv.addObject("pm", pm);
		mv.addObject("pList", pList);
		mv.setViewName("/searchList/searchDetailList");
		return mv;
	}
	@RequestMapping(value = "/searchList/searchFe")
	public ModelAndView searchFe(ModelAndView mv, Criteria cri) {
		if(cri == null) cri = new Criteria();
		
		mv.setViewName("/searchList/searchFe");
		return mv;
	}

}