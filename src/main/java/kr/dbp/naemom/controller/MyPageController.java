package kr.dbp.naemom.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService myPageService;
	
	@RequestMapping(value = "/mypage/main")
	public ModelAndView home(ModelAndView mv) {
		mv.setViewName("/mypage/main");
		return mv;
	}
	
}
