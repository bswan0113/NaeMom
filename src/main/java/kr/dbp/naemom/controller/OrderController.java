package kr.dbp.naemom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.service.OrderService;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.OptionListDTO;
import kr.dbp.naemom.vo.Option_accomodationVO;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;
import kr.dbp.naemom.vo.Option_restrauntVO;
import kr.dbp.naemom.vo.ProductVO;
import kr.dbp.naemom.vo.Shopping_basketVO;

@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping(value = "/option/opList", method=RequestMethod.GET)
	public ModelAndView opList(ModelAndView mv) {
		
		mv.setViewName("/option/opList");
		return mv;
	}
	@RequestMapping(value = "/option/opList", method=RequestMethod.POST)
	public ModelAndView selectOption(ModelAndView mv, @RequestParam("pd_num")String[] pd_num, 
			@RequestParam("pd_pc_num")String[] pd_pc_num) {
		ArrayList<ProductVO> pdList = new ArrayList<ProductVO>();
		ArrayList<FileVO> fList = new ArrayList<FileVO>();
		ArrayList<Option_landMarkVO> travelList = new ArrayList<Option_landMarkVO>();
		ArrayList<Option_restrauntVO> foodList = new ArrayList<Option_restrauntVO>();
		ArrayList<Option_accomodationVO> homeList = new ArrayList<Option_accomodationVO>();
		ArrayList<Option_festivalVO> festivalList = new ArrayList<Option_festivalVO>();
		for(String tmp : pd_num) {
			ProductVO product = orderService.getProductByPdNum(tmp);
			pdList.add(product);
			FileVO file = orderService.getFileByPdNum(tmp);
			fList.add(file);
			switch(product.getPd_pc_num()) {
			case 1 : 
				ArrayList<Option_landMarkVO> travel = orderService.getTravelByPdNum(tmp);
				if(travel != null)
				travelList.addAll(travel);
				break;
			case 2 :
				ArrayList<Option_restrauntVO> food = orderService.getFoodByPdNum(tmp);
				if(food != null)
				foodList.addAll(food);
				break;
			case 3 :
				ArrayList<Option_accomodationVO> home = orderService.getHomeByPdNum(tmp);
				if(home != null)
				homeList.addAll(home);
				break;
			case 4 :
				ArrayList<Option_festivalVO> festival = orderService.getFestivalByPdNum(tmp);
				if(festival != null)
				festivalList.addAll(festival);
				break;
			}
		}
		mv.addObject("pdList", pdList);
		mv.addObject("fList", fList);
		mv.addObject("travelList", travelList);
		mv.addObject("foodList", foodList);
		mv.addObject("homeList", homeList);
		mv.addObject("festivalList", festivalList);
		mv.setViewName("/option/opList");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/option/test", method=RequestMethod.POST)
	public Map<String, Object> test(@RequestBody List<OptionListDTO> list){
		Map<String, Object> map = new HashMap<String, Object>();
		//지워야될코드
		String id = "qwe";
		MemberVO user = new MemberVO();
		//MemberVO user = (MemberVO)session.getAttribute("user");
		//지워야될코드
		user.setMe_id(id);
		int res = orderService.addBasket(list, user.getMe_id());
		map.put("res", res);
		return map;
	}
	
	@RequestMapping(value = "/option/basket", method=RequestMethod.GET)
	public ModelAndView Basket(ModelAndView mv) {
		//지워야될코드
		String id = "qwe";
		MemberVO user = new MemberVO();
		//MemberVO user = (MemberVO)session.getAttribute("user");
		//지워야될코드
		user.setMe_id(id);
		ArrayList<Shopping_basketVO> basket = orderService.getBasket(user.getMe_id());
		ArrayList<ProductVO> prList = orderService.getProductByBasket(basket);
		ArrayList<FileVO> fList = orderService.getFileListByBasket(basket);
		mv.addObject("prList", prList);
		mv.addObject("basket", basket);
		mv.addObject("fList", fList);
		mv.setViewName("/option/basket");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/option/deleteBasket", method=RequestMethod.POST)
	public Map<String, Object> deleteBasket(@RequestBody int sb_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		//지워야될코드
		String id = "qwe";
		MemberVO user = new MemberVO();
		//MemberVO user = (MemberVO)session.getAttribute("user");
		//지워야될코드
		user.setMe_id(id);
		int res = orderService.deleteBasket(sb_num,user.getMe_id());
		
		map.put("res", res);
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/option/deleteAllBasket", method=RequestMethod.POST)
	public Map<String, Object> deleteAllBasket(@RequestBody int sb_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		//지워야될코드
		String id = "qwe";
		MemberVO user = new MemberVO();
		//MemberVO user = (MemberVO)session.getAttribute("user");
		//지워야될코드
		user.setMe_id(id);
		int res = orderService.deleteAllBasket(user.getMe_id());
		
		map.put("res", res);
		return map;
	}
	@RequestMapping(value = "/option/paymentList", method=RequestMethod.POST)
	public ModelAndView paymentList(ModelAndView mv,@RequestParam("sb_num")String[]sb_num) {
		//지워야될코드
		String id = "qwe";
		MemberVO user = new MemberVO();
		//MemberVO user = (MemberVO)session.getAttribute("user");
		//지워야될코드
		user.setMe_id(id);
		MemberVO member = orderService.getMember(user.getMe_id());
		ArrayList<Shopping_basketVO> basket = orderService.getBasketBySbNum(user.getMe_id(),sb_num);
		ArrayList<ProductVO> prList = orderService.getProductByBasket(basket);
		ArrayList<FileVO> fList = orderService.getFileListByBasket(basket);
		mv.addObject("member", member);
		mv.addObject("prList", prList);
		mv.addObject("basket", basket);
		mv.addObject("fList", fList);
		mv.setViewName("/option/payment");
		return mv;
	}
	@RequestMapping(value = "/option/payment", method=RequestMethod.GET)
	public ModelAndView payment(ModelAndView mv) {
		
		mv.setViewName("/option/payment");
		return mv;
	}
	
	
	
	
	
	
	
	
	
}
