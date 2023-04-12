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

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.pagination.PageMaker;
import kr.dbp.naemom.service.ProductService;
import kr.dbp.naemom.utils.MessageUtils;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.Option_accomodationVO;
import kr.dbp.naemom.vo.Option_restrauntVO;
import kr.dbp.naemom.vo.ProductCategoryVO;
import kr.dbp.naemom.vo.ProductVO;
import kr.dbp.naemom.vo.WishVO;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;
	

	//게시글 등록페이지 메서드
	@RequestMapping(value="/admin/insert/insertProduct", method=RequestMethod.POST)
	public ModelAndView insertProductPost(ModelAndView mv, ProductVO product, MultipartFile[] files, String redirect) {
		if(productService.insertProduct(product, files)) {
			if(redirect.equals("redirect")) {
				
				String category="";
				switch(product.getPd_pc_num()) {
				case 1: category="optionLandMark";
					break;
				case 2: category="optionRestraunt";
					break;
				case 3: category="optionAccomodation";
					break;
				case 4: category="optionFestival";
					break;
				default:
					mv.setViewName("/admin/insert/insertProduct");
					return mv;
				}
				mv.setViewName("redirect:/admin/insert/"+category+"/"+product.getPd_num());
				return mv;
			}
			else {
				mv.setViewName("/admin/insert/insertProduct");
			}
		}
		else {
			mv.setViewName("redirect:/admin/home/home");
		}
		return mv;
	}	
	
	@RequestMapping(value="/admin/update/updateProduct")
	public ModelAndView updateProduct(ModelAndView mv, ProductVO product, HttpServletResponse response) {
		boolean res = productService.updateProduct(product);

		if(!res) {			
			MessageUtils.alertAndMovePage(response, 
					"수정에 실패했습니다! / 내용수정 실패", 
					"/naemom", "/admin/insert/updateProduct/"+product.getPd_num());
		}
		
			
		else MessageUtils.alertAndMovePage(response, 
					"수정에 성공했습니다.", 
					"/naemom", "/admin/list/productList");
		
		return mv;
	}
	

	@RequestMapping(value="/admin/insert/updateProduct/{pd_num}", method=RequestMethod.GET)
	public ModelAndView insertProductget(ModelAndView mv, @PathVariable("pd_num")int pd_num) {
		ArrayList<ProductCategoryVO> category  = productService.getCategory();
		ProductVO product = productService.getProduct(pd_num);
		ArrayList<FileVO> fileList = productService.getFiles(pd_num);
		product.setFile(productService.getThumbnail(pd_num));
		mv.addObject("fileList", fileList);
		mv.addObject("product",product);
		mv.addObject("category", category);
		mv.setViewName("/admin/insert/updateProduct");
		return mv;
	}
	@RequestMapping(value="/admin/home/home")
	public ModelAndView adminMain(ModelAndView mv) {
		mv.setViewName("/admin/home/home");
		return mv;
	}

	@RequestMapping(value="/admin/insert/insertProduct", method=RequestMethod.GET)
	public ModelAndView insertProductget(ModelAndView mv, ProductVO product) {
		ArrayList<ProductCategoryVO> category  = productService.getCategory();
		mv.addObject("category", category);
		mv.setViewName("/admin/insert/insertProduct");
		return mv;
	}
	
	@RequestMapping(value="/admin/list/productList")
	public ModelAndView adminProductList(ModelAndView mv, Criteria cri) {
		if(cri==null)cri = new Criteria();
		ArrayList<ProductVO> list = productService.getProductList(cri);
		for(int i=0; i<list.size(); i++) {
			list.get(i).setFile(productService.getThumbnail(list.get(i).getPd_num()));
			list.get(i).setDayoff(productService.getDayOff(list.get(i).getPd_num()));
		}
		int totalCount = productService.getProductCount();
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		mv.addObject("pm", pm);
		mv.addObject("list", list);
		mv.setViewName("/admin/list/productList");
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
		ArrayList<ProductVO> randomProduct = productService.getRandomProduct();
		ArrayList<FileVO> random = productService.getThumbNailByRandomProduct(randomProduct);
		WishVO wish = productService.getWish(user.getMe_id(), pd_num);
		Double rating =productService.getRatingAvg(pd_num);
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
		ArrayList<Object> option =getOption(product.getPd_pc_num(), product.getPd_num());
		if(rating >=0)mv.addObject("rating", (double)Math.round(rating*10)/10);
		else mv.addObject("rating", "등록된 별점이 없습니다.");
		Option_accomodationVO optAcc= new Option_accomodationVO();
		Option_restrauntVO optReo = new Option_restrauntVO();
		
		for(int i=0; i<option.size(); i++) {
		    if(option.get(i) instanceof Option_accomodationVO) {
		        optAcc = (Option_accomodationVO)option.get(i);
		        optAcc.setFile(productService.getAoFileByOption(optAcc));
		        option.set(i, optAcc);
		    }
		    if(option.get(i) instanceof Option_restrauntVO) {
		        optReo = (Option_restrauntVO)option.get(i);
		        optReo.setFile(productService.getReoFileByOption(optReo));
		        option.set(i, optReo);
		    }
		}
		
		mv.addObject("option",option);
		mv.addObject("wish",wish);
		mv.addObject("randomProduct", randomProduct);
		mv.addObject("random", random);
		mv.addObject("files", files);
		mv.addObject("product", product);		
		mv.setViewName("/product/detail/detailLayoutTMP");
		return mv;
	}
	
	
	
	
	private ArrayList<Object> getOption(int pd_pc_num, int pd_num) {
		ArrayList<Object> option=null;
		if(pd_pc_num>5 || pd_num<0) return null;
		switch (pd_pc_num) {
		case 1:
			 option= productService.getLandMarkOption(pd_num);
			break;
		case 2:
			option= productService.getRestrauntOption(pd_num);
			break;
		case 3:
			 option=productService.getAcomodationOption(pd_num);
			break;
		case 4:
			 option =productService.getFestivalOption(pd_num);
			break;

		default:
			break;
		}
		return option;
	}

	@RequestMapping(value="/product/detail/**/{i}")
	public ModelAndView detailLayoutTMP(ModelAndView mv, ProductVO product) {
		mv.setViewName("/product/detail/detailLayoutTMP");
		return mv;
	}


	
	
}
