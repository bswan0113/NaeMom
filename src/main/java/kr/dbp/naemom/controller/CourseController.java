package kr.dbp.naemom.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.service.CourseService;
import kr.dbp.naemom.utils.MessageUtils;
import kr.dbp.naemom.vo.CourseVO;
import kr.dbp.naemom.vo.Hash_tagVO;
import kr.dbp.naemom.vo.ProductVO;

@Controller
public class CourseController {
	
	@Autowired
	CourseService courseService;
	
	@RequestMapping(value = "/course/insert", method=RequestMethod.GET)
	public ModelAndView course(ModelAndView mv,ProductVO pr) {
		
		
		mv.setViewName("/course/insert");
		return mv;
	}
	@RequestMapping(value = "/course/insert", method=RequestMethod.POST)
	public ModelAndView courseInsert(ModelAndView mv,CourseVO cos,ArrayList<String> pd_num) {
		String id = "qwe";
		//courseService.insertCourse(cos,id);
		System.out.println(pd_num);
		mv.setViewName("/course/insert");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/course/searchProduct", method=RequestMethod.POST)
	public Map<String, Object> courseSearchProduct(@RequestBody ProductVO pr,HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<ProductVO> products = courseService.getSearchProduct(pr);
		if(products == null) {
			MessageUtils.alertAndMovePage(response,"일치하는 상품이 없습니다.", "/naemom", "/course/insert");
			return map;
		}
		
		map.put("products", products);
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/course/selectProduct", method=RequestMethod.POST)
	public Map<String, Object> courseSelectProduct(@RequestBody int pd_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		ProductVO selectPr = courseService.getSelectProduct(pd_num);
		ArrayList<Hash_tagVO> tags = courseService.getHashTag(pd_num);
		map.put("tags", tags);
		map.put("selectPr", selectPr);
		return map;
	}
}
