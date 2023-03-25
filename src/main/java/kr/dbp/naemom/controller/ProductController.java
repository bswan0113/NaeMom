package kr.dbp.naemom.controller;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.service.ProductService;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.ProductCategoryVO;
import kr.dbp.naemom.vo.ProductVO;
import kr.dbp.naemom.vo.WishVO;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;

	//게시글 등록페이지 메서드
	@RequestMapping(value="/admin/insert/insertProduct", method=RequestMethod.POST)
	public ModelAndView insertProductPost(ModelAndView mv, ProductVO product, MultipartFile[] files) {
		if(productService.insertProduct(product, files))
		
		mv.setViewName("/admin/insert/insertProduct");
		else {
			mv.setViewName("redirect:/product/listtmp");
		}
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
	public ModelAndView detailLayout(ModelAndView mv, @PathVariable("i")int pd_num, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		MemberVO user = new MemberVO();   //임시로그인
		user.setMe_id("abcd");	//임시로그인
		session.setAttribute("user", user); //임시로그인
		
		ProductVO product= productService.getProduct(pd_num);
		ArrayList<FileVO> files = productService.getFiles(pd_num);
		ArrayList<FileVO> random = productService.getRandomThumbNail();
		ArrayList<ProductVO> randomProduct = productService.getRandomProduct();
		WishVO wish = productService.getWish(user.getMe_id(), pd_num);		
		
		Cookie[] cookies = request.getCookies();
		Cookie abuseCheck = null;
		ArrayList<String> check = new ArrayList<String>();
		if (cookies != null && cookies.length > 0){
			for(int i=0; i<cookies.length; i++) {
				check.add(cookies[i].getName());
			}
            for (int i = 0; i < cookies.length; i++){
            	if(check.indexOf("viewcount"+pd_num+user.getMe_id())<0) {
            		abuseCheck= new Cookie("viewcount"+pd_num+user.getMe_id(), session.getId());
            		abuseCheck.setMaxAge(60 * 60 * 24);
            		response.addCookie(abuseCheck);
            	}
            	
            }
            if(abuseCheck!=null)productService.updateViewCount(pd_num);
        }
		
		mv.addObject("wish",wish);
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
