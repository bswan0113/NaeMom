package kr.dbp.naemom.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.service.SearchService;
import kr.dbp.naemom.vo.CourseVO;
import kr.dbp.naemom.vo.ProductVO;


@Controller
public class SearchController {
	
	@Autowired
	SearchService searchService;
	
	@RequestMapping(value = "/searchList/searchMain")
	public ModelAndView searchMain(ModelAndView mv, @RequestParam(name = "search", required = false) String search, Criteria cri) {
		if(cri == null) cri = new Criteria();
		cri.setSearch(search);
		ArrayList<ProductVO> landmark = searchService.getProduct(cri,1);
		ArrayList<ProductVO> restraunt= searchService.getProduct(cri,2);
		ArrayList<ProductVO> accomodation= searchService.getProduct(cri,3);
		ArrayList<ProductVO> festival= searchService.getProduct(cri,4);
		ArrayList<CourseVO> course = searchService.getCourse(cri);
		System.out.println(course);
		mv.addObject("co", course);
		mv.addObject("search", search);
		mv.addObject("la", landmark);
		mv.addObject("re", restraunt);
		mv.addObject("ac", accomodation);
		mv.addObject("fe", festival);
		mv.setViewName("/searchList/searchMain");
		return mv;
	}

	@RequestMapping(value = "/searchList/searchAc")
	public ModelAndView searchAc(ModelAndView mv, @RequestParam(name = "search", required = false) String search, Criteria cri) {
		if(cri == null) cri = new Criteria();
		cri.setSearch(search);
		
		mv.setViewName("/searchList/searchAc");
		return mv;
	}
	@RequestMapping(value = "/searchList/searchRe")
	public ModelAndView searchRe(ModelAndView mv, @RequestParam(name = "search", required = false) String search, Criteria cri) {
		if(cri == null) cri = new Criteria();
		cri.setSearch(search);
		mv.setViewName("/searchList/searchRe");
		return mv;
	}
	@RequestMapping(value = "/searchList/searchFe")
	public ModelAndView searchFe(ModelAndView mv, @RequestParam(name = "search", required = false) String search, Criteria cri) {
		if(cri == null) cri = new Criteria();
		cri.setSearch(search);
		mv.setViewName("/searchList/searchFe");
		return mv;
	}
	@RequestMapping(value = "/searchList/searchLa")
	public ModelAndView searchLa(ModelAndView mv, @RequestParam(name = "search", required = false) String search, Criteria cri) {
		if(cri == null) cri = new Criteria();
		cri.setSearch(search);
		mv.setViewName("/searchList/searchLa");
		return mv;
	}
}