package kr.dbp.naemom.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.service.CourseService;
import kr.dbp.naemom.vo.CourseVO;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.Hash_tagVO;
import kr.dbp.naemom.vo.ProductCategoryVO;
import kr.dbp.naemom.vo.ProductVO;

@Controller
public class CourseController {
	
	@Autowired
	CourseService courseService;
	
	@RequestMapping(value = "/course/insert", method=RequestMethod.GET)
	public ModelAndView course(ModelAndView mv) {
		
		mv.setViewName("/course/insert");
		return mv;
	}
	@RequestMapping(value = "/course/insert", method=RequestMethod.POST)
	public ModelAndView courseInsert(ModelAndView mv,CourseVO cos,@RequestParam("pd_num[]")String[] pd_num,
			HttpServletResponse response) {
		String id = "qwe";
		int res = courseService.insertCourse(cos,id);
		String msg;
		if(res == 0 || pd_num.length == 0 || pd_num.length >10) {
			msg = "코스 등록에 실패했습니다.";
		}else {
			msg = "코스 등록에 성공했습니다.";
		}
		courseService.insertCourseItem(cos.getCo_num(),pd_num);
		mv.addObject("msg",msg);
		mv.addObject("url","/course/list");
		mv.setViewName("/course/message");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/course/searchProduct", method=RequestMethod.POST)
	public Map<String, Object> courseSearchProduct(@RequestBody ProductVO pr,HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<ProductVO> products = courseService.getSearchProduct(pr);
		ArrayList<ProductCategoryVO> pdCategory = courseService.getProductCategory();
		map.put("pdCategory", pdCategory);
		map.put("products", products);
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/course/selectProduct", method=RequestMethod.POST)
	public Map<String, Object> courseSelectProduct(@RequestBody int pd_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		ProductVO selectPr = courseService.getSelectProduct(pd_num);
		ArrayList<Hash_tagVO> tags = courseService.getHashTag(pd_num);
		FileVO file = courseService.getProductImg(pd_num);
		map.put("file", file);
		map.put("tags", tags);
		map.put("selectPr", selectPr);
		return map;
	}
	@RequestMapping(value = "/course/list", method=RequestMethod.GET)
	public ModelAndView courseList(ModelAndView mv) {
		ArrayList<CourseVO> list = courseService.getCourseList();
		
		mv.setViewName("/course/list");
		return mv;
	}
}
