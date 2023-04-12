package kr.dbp.naemom.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.service.MyPageService;
import kr.dbp.naemom.vo.MemberVO;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService myPageService;
	
	@RequestMapping(value = "/mypage/main")
	public ModelAndView home(ModelAndView mv) {
		MemberVO user = new MemberVO();
		user.setMe_id("abcd");
		user = myPageService.getUserInfo(user);
		mv.addObject("user",user);
		mv.setViewName("/mypage/main");
		return mv;
	}

	private MemberVO CreteTmpUser(MemberVO user) {
		user.setMe_authority(10);
		user.setMe_gender("남");
		user.setMe_detail_address("오벨리스크 401호");
		user.setMe_id("abcdefg");
		user.setMe_ma_email("zkoiu@naver.com");
		user.setMe_mileage(100);
		user.setMe_nickname("건우");
		user.setMe_phone("010-3151-7063");
		user.setMe_street_address("서울시 은평구 가좌로 165");
		user.setMe_registered_address("서울시 은평구 응암동 375-2");
		user.setMe_pw("1q2w3e4r!");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birthday;
		try {
			birthday = sdf.parse("1993-01-13");
			user.setMe_birthday(birthday);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		user.setMe_session_limit(new Date(System.currentTimeMillis() - 24 * 60 * 60 * 1000));
		return user;
	}
	
	
	
}
