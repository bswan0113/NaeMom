package kr.dbp.naemom.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.dbp.naemom.service.ProductService;
import kr.dbp.naemom.vo.MemberVO;


@RestController
public class ProductAjaxController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = "/product/like/{pd_num}/{li_state}", method=RequestMethod.GET)
	public Map<String, Object> likeUpdate(
			@PathVariable("pd_num")int pd_num, @PathVariable("li_state")int li_state,
			HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		Map<String, Object> map = new HashMap<String, Object>();
		int res =productService.likeUpdate(user.getMe_id(),pd_num,li_state);
		map.put("res", res);
		return map;
	}
}
