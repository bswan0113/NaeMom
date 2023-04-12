package kr.dbp.naemom.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.service.HomeService;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.ProductVO;

@Controller
public class HomeController {
	
	@Autowired
	HomeService homeService;
	

	@RequestMapping(value = "/")
	public ModelAndView home(ModelAndView mv, @RequestParam(required = false,defaultValue = "0")int pd_num) {

		ArrayList<ProductVO> plist = homeService.getCheckedList();
		ArrayList<FileVO> files = new ArrayList<FileVO>();
		for(int i = 0; i < plist.size() ; i++) {
			plist.get(i).setFile(homeService.getFiles(plist.get(i).getPd_num()));
		}
		mv.addObject("files", files);
		mv.addObject("plist", plist);
		mv.setViewName("/main/home");
		return mv;
	}

	// 콘텐츠 등록 페이지 1
	@RequestMapping(value = "/main/insert", method = RequestMethod.GET)
	public ModelAndView homeContentsearch(ModelAndView mv, String keyword) {
	    ArrayList<ProductVO> plist = homeService.searchProductByKeyword(keyword);
	    mv.addObject("plist", plist);
	    mv.setViewName("/main/insert");
	    return mv;
	}
	
	// 체크된 상품 DB 추가
	@RequestMapping(value = "/main/insert/checked", method = RequestMethod.POST)
    public ModelAndView insertProductChecked(ModelAndView mv, ProductVO product, int[] pdc_checked) throws Exception {
		homeService.deleteProductChecked(pdc_checked);
		homeService.insertProductChecked(pdc_checked);
		ArrayList<ProductVO> plist = homeService.getCheckedList();
		mv.addObject("plist", plist);
		mv.setViewName("redirect:/");
        return mv;
    }
	
	//home.jsp의 foreach안의 
	
	
	
//	// 체크 DB에 있는 상품 가져와서 home.jsp로 보내주기
//	@RequestMapping(value="/main/insert/checked/post")
//	public ModelAndView updatehomeContent(ModelAndView mv) {
//		
//		mv.setViewName("/");
//		return mv;
//	}
	
	
//	
//	@RequestMapping(value = "/main/insert/product_checked", method = RequestMethod.POST)
//    public ModelAndView productChecked(HttpServletRequest request, ModelAndView mv) throws Exception {
//        String[] checkedPids = request.getParameterValues("checkedPids");
//        homeService.updateProductChecked(checkedPids);
//        mv.setViewName("redirect:/main/insert");
//        return mv;
//    }
//	

//	
//    @RequestMapping(value = "/main/insert/update_product", method = RequestMethod.POST)
//    public ModelAndView updateProduct(HttpServletRequest request, ModelAndView mv) throws Exception {
//        String pd_title = request.getParameter("pd_title");
//        String pd_content = request.getParameter("pd_content");
//        homeService.updateProduct(pd_title, pd_content);
//        mv.setViewName("redirect:/home");
//        return mv;
//    }

	
}
