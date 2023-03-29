package kr.dbp.naemom.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.pagination.PageMaker;
import kr.dbp.naemom.service.CourseService;
import kr.dbp.naemom.vo.CourseItemVO;
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
	public ModelAndView courseList(ModelAndView mv, Criteria cri) {
		cri.setPerPageNum(6);
		ArrayList<CourseVO> list = courseService.getCourseList(cri);
		ArrayList<CourseItemVO> items = new ArrayList<CourseItemVO>();
		for(int i=0;i<list.size();i++) {
			items.addAll(courseService.getCourseItem(list.get(i).getCo_num()));
			
		}
		ArrayList<FileVO> files = courseService.getProductImgList();;
		int totalCount = courseService.getTotalCountBoard(cri);
		int displayPageNum = 3;
		PageMaker pm = 
			new PageMaker(totalCount, displayPageNum, cri);
		mv.addObject("items", items);
		mv.addObject("files", files);
		mv.addObject("list", list);
		mv.addObject("pm", pm);
		mv.setViewName("/course/list");
		return mv;
	}
	@RequestMapping(value = "/course/detail/{co_num}", method=RequestMethod.GET)
	public ModelAndView courseDetail(ModelAndView mv,@PathVariable("co_num")int co_num) {
		CourseVO course = courseService.getcourseByNum(co_num);
		ArrayList<CourseItemVO> items = courseService.getCourseItem(co_num);
		ArrayList<FileVO> files = new ArrayList<FileVO>();
		ArrayList<ProductVO> prlist = new ArrayList<ProductVO>();
		ArrayList<Hash_tagVO> tags = new ArrayList<Hash_tagVO>();
		selectList(items,files,prlist,tags);
		mv.addObject("tags", tags);
		mv.addObject("prlist", prlist);
		mv.addObject("course",course);
		mv.addObject("items", items);
		mv.addObject("files", files);
		mv.setViewName("/course/detail");
		return mv;
	}
	private void selectList(ArrayList<CourseItemVO> items, ArrayList<FileVO> files, ArrayList<ProductVO> prlist,
			ArrayList<Hash_tagVO> tags) {
		for(CourseItemVO tmp : items) {
			ProductVO pr = courseService.getSelectProduct(tmp.getCi_pd_num());
			tags.addAll(courseService.getHashTag(tmp.getCi_pd_num()));
			FileVO file = courseService.getProductImg(tmp.getCi_pd_num());
			prlist.add(pr);
			files.add(file);
		}
		
	}
	@RequestMapping(value = "/course/delete/{co_num}", method=RequestMethod.POST)
	public ModelAndView courseDelete(ModelAndView mv,@PathVariable("co_num")int co_num) {
		boolean res = courseService.deleteCourse(co_num);
		String url = "/course/list";
		String msg;
		if(res) {
			msg = "코스 삭제 성공!";
		}else {
			msg = "코스 삭제 실패!";
		}
		mv.addObject("msg",msg);
		mv.addObject("url", url);
		mv.setViewName("/course/message");
		return mv;
	}
	@RequestMapping(value = "/course/update/{co_num}", method=RequestMethod.GET)
	public ModelAndView courseUpdate(ModelAndView mv,@PathVariable("co_num")int co_num) {
		CourseVO course = courseService.getcourseByNum(co_num);
		ArrayList<CourseItemVO> items = courseService.getCourseItem(co_num);
		ArrayList<FileVO> files = new ArrayList<FileVO>();
		ArrayList<ProductVO> prlist = new ArrayList<ProductVO>();
		ArrayList<Hash_tagVO> tags = new ArrayList<Hash_tagVO>();
		mv.addObject("tags", tags);
		mv.addObject("prlist", prlist);
		mv.addObject("course",course);
		mv.addObject("items", items);
		mv.addObject("files", files);
		mv.setViewName("/course/update");
		return mv;
	}
}
