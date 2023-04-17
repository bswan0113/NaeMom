package kr.dbp.naemom.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.service.SearchService;
import kr.dbp.naemom.vo.ProductVO;


@Controller
public class SearchController {
	
	@Autowired
	SearchService searchService;
	
	@RequestMapping(value = "/searchList/searchMain")
	public ModelAndView home(ModelAndView mv, @RequestParam(name = "search", required = false) String search, Criteria cri) {
		if(cri == null) cri = new Criteria();
		cri.setSearch(search);
		ArrayList<ProductVO> landmark = searchService.getProduct(cri,1);
		ArrayList<ProductVO> restraunt= searchService.getProduct(cri,2);
		ArrayList<ProductVO> accomodation= searchService.getProduct(cri,3);
		ArrayList<ProductVO> festival= searchService.getProduct(cri,4);
		
		
		System.out.println(cri);
		mv.addObject("search", search);
		mv.addObject("la", landmark);
		mv.addObject("re", restraunt);
		mv.addObject("ac", accomodation);
		mv.addObject("fe", festival);
		mv.setViewName("/searchList/searchMain");
		return mv;
	}
}