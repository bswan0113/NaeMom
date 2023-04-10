package kr.dbp.naemom.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.service.ProductOptionService;
import kr.dbp.naemom.service.ProductService;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;
import kr.dbp.naemom.vo.ProductVO;
import kr.dbp.naemom.vo.TempOFFVO;

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
	
	@RequestMapping(value="/admin/insert/dayofftmp/{pd_num}", method = RequestMethod.GET)
	public ModelAndView insertDayOffTmp(ModelAndView mv, @PathVariable("pd_num") int pd_num) {
		ProductVO product = productService.getProduct(pd_num);
		mv.addObject("product", product);
		mv.setViewName("/admin/insert/dayofftmp");
		return mv;
	}
	@RequestMapping(value="/admin/insert/dayofftmp", method = RequestMethod.POST)
	public ModelAndView insertDayOffTmpPOST(ModelAndView mv, TempOFFVO temp, String pd_num) {
		int productNum = Integer.parseInt(pd_num);
		
		if(productOptionService.insertDayOffTmp(temp,productNum)) {			
			mv.setViewName("redirect:/admin/list/productList");
		}else {
			mv.setViewName("redirect:/admin/insert/dayofftmp/"+pd_num);
		}
		return mv;
	}
}
