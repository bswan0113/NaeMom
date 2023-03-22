package kr.dbp.naemom.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.service.CourseService;
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
	public ModelAndView courseInsert(ModelAndView mv,CourseVO cos,ArrayList<ProductVO> pr) {
		String id = "qwe";
		courseService.insertCourse(cos,id);
		mv.setViewName("/course/insert");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/searchProduct", method=RequestMethod.POST)
	public Map<String, Object> courseSearchProduct(@RequestBody ProductVO pr) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<ProductVO> products = courseService.getSearchProduct(pr);
		for(ProductVO tmp : products) {
			ArrayList<Hash_tagVO> tags = courseService.getHashTag(tmp.getPd_num());
			map.put("tags", tags);
		}
		map.put("products", products);
		return map;
	}
}
