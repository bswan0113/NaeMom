package kr.dbp.naemom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.bootpay.Bootpay;
import kr.dbp.naemom.service.OrderService;
import kr.dbp.naemom.utils.MessageUtils;
import kr.dbp.naemom.vo.Buy_listVO;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.OptionListDTO;
import kr.dbp.naemom.vo.Option_accomodationVO;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;
import kr.dbp.naemom.vo.Option_restrauntVO;
import kr.dbp.naemom.vo.PayDTO;
import kr.dbp.naemom.vo.ProductVO;
import kr.dbp.naemom.vo.Reservated_optionVO;
import kr.dbp.naemom.vo.Shopping_basketVO;
import kr.dbp.naemom.vo.Use_memberVO;

@Controller
public class OrderController {
	
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping(value = "/option/opList", method=RequestMethod.GET)
	public ModelAndView opList(ModelAndView mv,HttpSession session,HttpServletResponse response) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null) {
			MessageUtils.alertAndMovePage(response, 
					"로그인하신 후 이용가능합니다.", "/naemom", "/login");
		}
		mv.setViewName("/option/opList");
		return mv;
	}
	@RequestMapping(value = "/option/opList", method=RequestMethod.POST)
	public ModelAndView selectOption(ModelAndView mv, @RequestParam("pd_num")String[] pd_num,HttpSession session,HttpServletResponse response, 
			@RequestParam("pd_pc_num")String[] pd_pc_num) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null) {
			MessageUtils.alertAndMovePage(response, 
					"로그인하신 후 이용가능합니다.", "/naemom", "/login");
		}
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
	public Map<String, Object> test(@RequestBody List<OptionListDTO> list,HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		int res = orderService.addBasket(list, user.getMe_id());
		map.put("res", res);
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/option/checkFood", method=RequestMethod.POST)
	public Map<String, Object> checkFood(@RequestBody Reservated_optionVO ro,HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		ArrayList<Reservated_optionVO> res = orderService.checkFood(ro, user.getMe_id());
		map.put("res", res);
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/option/dateConfirm", method=RequestMethod.POST)
	public Map<String, Object> dateConfirm(@RequestBody String checkIn,HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		
		int res = orderService.selectReservationRoom(checkIn);
		map.put("res", res);
		return map;
	}
	@RequestMapping(value = "/option/basket", method=RequestMethod.GET)
	public ModelAndView Basket(ModelAndView mv,HttpSession session,HttpServletResponse response) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null) {
			MessageUtils.alertAndMovePage(response, 
					"로그인하신 후 이용가능합니다.", "/naemom", "/login");
		}
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
	@RequestMapping(value = "/option/checkProduct", method=RequestMethod.POST)
	public Map<String, Object> checkProduct(@RequestBody String[]list,HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		int pd_num = orderService.checkProduct(list, user.getMe_id());
		map.put("pd_num", pd_num);
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/option/impossibleProduct", method=RequestMethod.POST)
	public Map<String, Object> impossibleProduct(@RequestBody String pd_num,HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		ProductVO pd = orderService.getProductByPdNum(pd_num);
		map.put("pd", pd);
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/option/deleteBasket", method=RequestMethod.POST)
	public Map<String, Object> deleteBasket(@RequestBody int sb_num,HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		int res = orderService.deleteBasket(sb_num,user.getMe_id());
		
		map.put("res", res);
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/option/deleteAllBasket", method=RequestMethod.POST)
	public Map<String, Object> deleteAllBasket(@RequestBody int sb_num,HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		int res = orderService.deleteAllBasket(user.getMe_id());
		
		map.put("res", res);
		return map;
	}
	@RequestMapping(value = "/option/paymentList", method=RequestMethod.GET)
	public ModelAndView paymentList(ModelAndView mv,HttpSession session,HttpServletResponse response) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null) {
			MessageUtils.alertAndMovePage(response, 
					"로그인하신 후 이용가능합니다.", "/naemom", "/login");
		}else {
			MessageUtils.alertAndMovePage(response, 
					"장바구니에서 상품을 주문해주세요.", "/naemom", "/option/basket");
		}
		
		mv.setViewName("/option/payment");
		return mv;
	}
	@RequestMapping(value = "/option/paymentList", method=RequestMethod.POST)
	public ModelAndView paymentList(ModelAndView mv,@RequestParam("sb_num")String[]sb_num,HttpSession session,HttpServletResponse response) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null) {
			MessageUtils.alertAndMovePage(response, 
					"로그인하신 후 이용가능합니다.", "/naemom", "/login");
		}
		ArrayList<Shopping_basketVO> basket = orderService.getBasketBySbNum(user.getMe_id(),sb_num);
		ArrayList<ProductVO> prList = orderService.getProductByBasket(basket);
		ArrayList<FileVO> fList = orderService.getFileListByBasket(basket);
		mv.addObject("member", user);
		mv.addObject("prList", prList);
		mv.addObject("basket", basket);
		mv.addObject("fList", fList);
		mv.setViewName("/option/payment");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/option/bootpay_confirm", method=RequestMethod.POST)
	public String bootpay_confirm(Model mv, @RequestBody PayDTO dto) {
		String success = "";
		try {
			Bootpay bootpay = new Bootpay("64424e90922c3400236cdc6d", "+4cFoL6IJOcQzITCJ7LRLZMGM/fiymQiTGLgc/AfIJ8=");
			String bootpay_check = "";
			bootpay.getAccessToken();
			HttpResponse res = bootpay.verify(dto.getReceipt_id());
			bootpay_check = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
		    
		    String receiptId = dto.getReceipt_id(); 
		    String pay_money =  Integer.toString((dto.getPrice()));
		    JSONParser jsonParse = new JSONParser();
			JSONObject jsonObj = (JSONObject)jsonParse.parse(bootpay_check);
			JSONObject jsonObj2 = (JSONObject)jsonParse.parse((jsonObj.get("data").toString()));
			// 결제 상태
			String boot_status = (jsonObj.get("status")).toString();
			// 부트페이에서 넘겨주는 pgid
			String boot_pgid = (jsonObj2.get("receipt_id")).toString();
			// 부트페이에서 넘겨주는 pay_money
			String boot_pay_money = (jsonObj2.get("price")).toString();
			// 부트페이에서 넘겨주는 거래상태 (1일 경우 결제 완료 상태)
			String boot_status2 = (jsonObj2.get("status")).toString();
			// 거래상태코드
			if(boot_status.equals("200")){
				// 서버검증
				if(boot_pgid.equals(receiptId) 
						&&  boot_pay_money.equals(pay_money) 
						&&  boot_status2.equals("1")) 
				{
					System.out.println("이니시스 부트페이 비교 검증 성공");
					success = "OK";
					//성공
					return success;
				}
			}
		} catch (Exception e) {
		    e.printStackTrace();
		    success = "NO";
		    return success;
		}
		return success;
	}
	@ResponseBody
	@RequestMapping(value = "/option/insertBuyList", method=RequestMethod.POST)
	public String buyList(@RequestBody PayDTO dto,HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		String res = orderService.insertBuyList(dto,user.getMe_id());
		
		return res;
	}
	@ResponseBody
	@RequestMapping(value = "/option/updateBuyList", method=RequestMethod.POST)
	public String updatebuyList(@RequestBody String bl_num,HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		String success = "OK";
		bl_num = bl_num.replaceAll("[^\\w+]", "");
		int res = orderService.updateBuyList(bl_num,user.getMe_id());
		if(res == 0) {
			success = "NO";
		}else {
			success=bl_num;
		}
		return success;
	}
	@ResponseBody
	@RequestMapping(value = "/option/insertUseMember", method=RequestMethod.POST)
	public String insertUseMember(@RequestBody Use_memberVO useMember,HttpSession session) {
		String success = "OK";
		useMember.setUm_bl_num(useMember.getUm_bl_num().replaceAll("[^\\w+]", ""));
		System.out.println(useMember);
		int res = orderService.insertUseMember(useMember);
		if(res == 0) {
			success = "NO";
		}
		return success;
	}
	@ResponseBody
	@RequestMapping(value = "/option/deleteBuyList", method=RequestMethod.POST)
	public String deletebuyList(@RequestBody String bl_num,HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		String success = "OK";
		bl_num = bl_num.replaceAll("[^\\w+]", "");
		int res = orderService.deleteBuyList(bl_num,user.getMe_id());
		if(res == 0) {
			success = "NO";
		}
		return success;
	}
	@RequestMapping(value = "/option/completeBuy", method=RequestMethod.GET)
	public ModelAndView getCompleteBuy(ModelAndView mv,HttpSession session,HttpServletResponse response,String bl_num) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null) {
			MessageUtils.alertAndMovePage(response, 
					"로그인하신 후 이용가능합니다.", "/naemom", "/login");
		}else {
			/*MessageUtils.alertAndMovePage(response, 
					"잘못된 접근입니다.\n메인화면으로 이동합니다.", "/naemom", "/");*/
			Buy_listVO bl = orderService.getBuyListByBlNum(bl_num);
			mv.addObject("bl", bl);
		}
		mv.setViewName("/option/completeBuy");
		return mv;
	}
	@RequestMapping(value = "/option/completeBuy", method=RequestMethod.POST)
	public ModelAndView completeBuy(ModelAndView mv,HttpSession session,String bl_num) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		Buy_listVO bl = orderService.getBuyListByBlNum(bl_num);
		orderService.insertMileage(bl);
		orderService.insertReservation(bl);
		orderService.deleteAllBasket(bl.getBl_me_id());
		mv.addObject("bl_num", bl_num);
		mv.setViewName("redirect:/option/completeBuy");
		return mv;
	}
	
	
	
	
	
	
	
}
