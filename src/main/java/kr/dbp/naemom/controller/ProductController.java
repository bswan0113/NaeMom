package kr.dbp.naemom.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.service.ProductService;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.ProductCategoryVO;
import kr.dbp.naemom.vo.ProductVO;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;

	//게시글 등록페이지 메서드
	@RequestMapping(value="/admin/insert/insertProduct", method=RequestMethod.POST)
	public ModelAndView insertProductPost(ModelAndView mv, ProductVO product, MultipartFile[] files) {
		productService.insertProduct(product, files);
		mv.setViewName("/admin/insert/insertProduct");
		return mv;
	}
	@RequestMapping(value="/admin/insert/insertProduct", method=RequestMethod.GET)
	public ModelAndView insertProductget(ModelAndView mv, ProductVO product) {
		ArrayList<ProductCategoryVO> category  = productService.getCategory();
		mv.addObject("category", category);
		mv.setViewName("/admin/insert/insertProduct");
		return mv;
	}
	//임시 목록페이지
	@RequestMapping(value="/product/listtmp")
	public ModelAndView listtmp(ModelAndView mv) {
		mv.setViewName("/product/listtmp");
		return mv;
	}
	//임시 검색목록 페이지
	@RequestMapping(value="/product/searchTmp")
	public ModelAndView searchTmp(ModelAndView mv) {
		
		ArrayList<ProductVO> list = productService.getProductList();
		mv.addObject("product",list);
		
		mv.setViewName("/product/searchTmp");
		return mv;
	}
	//상세페이지 레이아웃
	@RequestMapping(value="/product/detail/detailLayoutTMP/{i}", method=RequestMethod.GET)
	public ModelAndView detailLayout(ModelAndView mv, @PathVariable("i")int pd_num) {
		ProductVO product= productService.getProduct(pd_num);
		ArrayList<FileVO> files = productService.getFiles(pd_num);
		ArrayList<FileVO> random = productService.getRandomThumbNail();
		ArrayList<ProductVO> randomProduct = productService.getRandomProduct();
		mv.addObject("randomProduct", randomProduct);
		mv.addObject("random", random);
		mv.addObject("files", files);
		mv.addObject("product", product);		
		mv.setViewName("/product/detail/detailLayoutTMP");
		return mv;
	}
	
	
	@RequestMapping(value="/product/detail/accomodation/{i}", method=RequestMethod.GET)
	public ModelAndView accomodationGet(ModelAndView mv, ProductVO product, @PathVariable("i")int pr_num) {
		
		mv.setViewName("/product/detail/accomodation/{i}");
		return mv;
	}
	@RequestMapping(value="/product/detail/restraunt/{i}", method=RequestMethod.GET)
	public ModelAndView restrauntGet(ModelAndView mv, ProductVO product, @PathVariable("i")int pr_num) {
			mv.setViewName("/product/detail/restraunt/{i}");
		return mv;
	}
	@RequestMapping(value="/product/detail/festival/{i}", method=RequestMethod.GET)
	public ModelAndView festivalGet(ModelAndView mv, ProductVO product, @PathVariable("i")int pr_num) {
		mv.setViewName("/product/detail/festival/{i}");
		return mv;
	}
	@RequestMapping(value="/product/detail/landMark/{i}", method=RequestMethod.GET)
	public ModelAndView landMarkGet(ModelAndView mv, ProductVO product, @PathVariable("i")int pr_num) {
		mv.setViewName("/product/detail/landMark/{i}");
		return mv;
	}
	@RequestMapping(value="/product/detail/detailLayoutTMP")
	public ModelAndView detailLayoutTMP(ModelAndView mv, ProductVO product) {
		mv.setViewName("/product/detail/detailLayoutTMP");
		return mv;
	}
	
	
}
