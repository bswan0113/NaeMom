package kr.dbp.naemom.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.service.ProductService;
import kr.dbp.naemom.vo.ProductCategoryVO;
import kr.dbp.naemom.vo.ProductVO;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;

	//게시글 등록페이지 메서드
	@RequestMapping(value="/product/insert/insertProduct", method=RequestMethod.POST)
	public ModelAndView insertProductPost(ModelAndView mv, ProductVO product, MultipartFile[] files) {
		productService.insertProduct(product, files);
		mv.setViewName("/product/insert/insertProduct");
		return mv;
	}
	@RequestMapping(value="/product/insert/insertProduct", method=RequestMethod.GET)
	public ModelAndView insertProductget(ModelAndView mv, ProductVO product) {
		ArrayList<ProductCategoryVO> category  = productService.getCategory();
		mv.addObject("category", category);
		mv.setViewName("/product/insert/insertProduct");
		return mv;
	}
	//임시 목로페이지
	@RequestMapping(value="/product/listtmp")
	public ModelAndView listtmp(ModelAndView mv) {
		mv.setViewName("/product/listtmp");
		return mv;
	}
	
	
}
