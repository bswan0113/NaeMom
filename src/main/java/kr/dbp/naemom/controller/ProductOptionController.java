package kr.dbp.naemom.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.service.ProductOptionService;
import kr.dbp.naemom.service.ProductService;
import kr.dbp.naemom.utils.MessageUtils;
import kr.dbp.naemom.vo.Option_accomodationDTO;
import kr.dbp.naemom.vo.Option_accomodationVO;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;
import kr.dbp.naemom.vo.Option_restrauntDTO;
import kr.dbp.naemom.vo.Option_restrauntVO;
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
		ArrayList<Object> list = productService.getAcomodationOption(pd_num);
		ArrayList<Option_accomodationVO> optionList = new ArrayList<Option_accomodationVO>();
		

		for(Object obj : list) {
		    Option_accomodationVO option = (Option_accomodationVO) obj;
		    optionList.add(option);
		}
		for(int i=0; i<optionList.size();i++) {
			optionList.get(i).setFile(productOptionService.getFileAOption(optionList.get(i).getAo_num()));
		}
		mv.addObject("optionList", optionList);
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
		ArrayList<Object> list = productService.getRestrauntOption(pd_num);
		ArrayList<Option_restrauntVO> optionList = new ArrayList<Option_restrauntVO>();

		for(Object obj : list) {
		    Option_restrauntVO option = (Option_restrauntVO) obj;
		    optionList.add(option);
		}
		for(int i=0; i<optionList.size();i++) {
			optionList.get(i).setFile(productOptionService.getFileREOption(optionList.get(i).getReo_num()));
		}
		mv.addObject("pd_num", pd_num);
		mv.addObject("optionList", optionList);
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
		ArrayList<TempOFFVO> tmpList= productOptionService.getDayOffTmp(pd_num);
		mv.addObject("tmp", tmpList);
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
	
	@RequestMapping(value="/insert/option/restraunt", method=RequestMethod.POST)
	public ModelAndView insertRestraunt(ModelAndView mv, Option_restrauntDTO reoList, MultipartFile[] files, String pd_num, HttpServletResponse response){
		if(reoList.getList().size()<=0) {
			MessageUtils.alertAndMovePage(response, 
					"저장할 내용이 없습니다!", 
					"/naemom", "/admin/insert/optionRestraunt/"+pd_num);
		}
		if(!productOptionService.insertRestraunt(reoList.getList(), files)){			
			MessageUtils.alertAndMovePage(response, 
					"수정에 실패했습니다! / 내용수정 실패", 
					"/naemom", "/admin/insert/optionRestraunt/"+pd_num);
		}
		
			
		else MessageUtils.alertAndMovePage(response, 
					"수정에 성공했습니다.", 
					"/naemom", "/admin/insert/optionRestraunt/"+pd_num);
		return mv;		
	}
	
	
	@RequestMapping(value="/insert/option/accomodation", method=RequestMethod.POST)
	public ModelAndView insertAccomodation(ModelAndView mv, Option_accomodationDTO acoList, MultipartFile[] files, String pd_num, HttpServletResponse response){
		if(acoList.getList().size()<=0) {
			MessageUtils.alertAndMovePage(response, 
					"저장할 내용이 없습니다!", 
					"/naemom", "/admin/insert/optionAccomodation/"+pd_num);
		}
		if(!productOptionService.insertAccomodation(acoList.getList(), files)){			
			MessageUtils.alertAndMovePage(response, 
					"수정에 실패했습니다! / 내용수정 실패", 
					"/naemom", "/admin/insert/optionAccomodation/"+pd_num);
		}
		
			
		else MessageUtils.alertAndMovePage(response, 
					"수정에 성공했습니다.", 
					"/naemom", "/admin/insert/optionAccomodation/"+pd_num);
		return mv;		
	}
	
	
}
