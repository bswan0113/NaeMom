package kr.dbp.naemom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.service.ProductService;
import kr.dbp.naemom.vo.ProductVO;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;

	
	@RequestMapping(value="/product/insert/insertProduct")
	public ModelAndView insertProduct(ModelAndView mv, ProductVO product) {
		productService.insertProduct(product);
		mv.setViewName("product/insert/insertProduct");
		return mv;
	}
	
	
	
	@RequestMapping(value = "/product/detail/accomodation/{i}", method = RequestMethod.GET)
	public ModelAndView accomodation(ModelAndView mv, @PathVariable int i) {
		mv.setViewName("/product/detail/accomodation/{i}");
		return mv;
	}
	
	@RequestMapping(value = "/product/detail/restraunt", method = RequestMethod.GET)
	public ModelAndView restraunt(ModelAndView mv) {
		mv.setViewName("/product/detail/restraunt");
		return mv;
	}
	
	@RequestMapping(value = "/product/detail/festival", method = RequestMethod.GET)
	public ModelAndView festival(ModelAndView mv) {
		mv.setViewName("/product/detail/festival");
		return mv;
	}
	
	@RequestMapping(value = "/product/detail/landMark", method = RequestMethod.GET)
	public ModelAndView landMark(ModelAndView mv) {
		mv.setViewName("/product/detail/landMark");
		return mv;
	}
	
}
