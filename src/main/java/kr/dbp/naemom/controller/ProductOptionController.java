package kr.dbp.naemom.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.service.ProductOptionService;
import kr.dbp.naemom.service.ProductService;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;

@Controller
public class ProductOptionController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ProductOptionService productOptionService;
	

	
	@RequestMapping(value="/admin/insert/optionAccomodation/{pd_num}")
	public ModelAndView insertOptionAccomodation(ModelAndView mv, HttpSession session, @PathVariable("pd_num")int pd_num) {
		mv.addObject("pd_num", pd_num);
		mv.setViewName("/admin/insert/optionAccomodation");
		return mv;
	}
	@RequestMapping(value="/admin/insert/optionFestival/{pd_num}")
	public ModelAndView insertOptionFestival(ModelAndView mv, HttpSession session, @PathVariable("pd_num")int pd_num) {
		ArrayList<Object> list = productService.getFestivalOption(pd_num);
		ArrayList<Option_festivalVO> optionList = new ArrayList<Option_festivalVO>();

		for(Object obj : list) {
		    Option_festivalVO option = (Option_festivalVO) obj;
		    optionList.add(option);
		}
		mv.addObject("optionList", optionList);
		mv.setViewName("/admin/insert/optionFestival");
		return mv;
	}
	@RequestMapping(value="/admin/insert/optionRestraunt/{pd_num}")
	public ModelAndView insertOptionRestraunt(ModelAndView mv, HttpSession session, @PathVariable("pd_num")int pd_num) {
		mv.addObject("pd_num", pd_num);
		mv.setViewName("/admin/insert/optionRestraunt");
		return mv;
	}
	@RequestMapping(value="/admin/insert/optionLandMark/{pd_num}")
	public ModelAndView insertOptionLandMark(ModelAndView mv, HttpSession session, @PathVariable("pd_num")int pd_num) {
		ArrayList<Object> list = productService.getLandMarkOption(pd_num);
		ArrayList<Option_landMarkVO> optionList = new ArrayList<Option_landMarkVO>();

		for(Object obj : list) {
		    Option_landMarkVO option = (Option_landMarkVO) obj;
		    optionList.add(option);
		}
		mv.addObject("optionList", optionList);
		mv.addObject("pd_num", pd_num);
		mv.setViewName("/admin/insert/optionLandMark");
		return mv;
	}
}
