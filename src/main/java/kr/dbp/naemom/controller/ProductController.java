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
		mv.setViewName("/product/insert/insertProduct");
		return mv;
	}
	
	
	
	@RequestMapping(value="/product/detail/accomodation/{i}", method = RequestMethod.GET)
	public ModelAndView viewProductAcommodation(ModelAndView mv, @PathVariable("i")int i) {
		ProductVO product = productService.getProduct(i);
		mv.addObject("product",product);
		mv.setViewName("/product/detail/accomodation");
		return mv;
	}
	
}
