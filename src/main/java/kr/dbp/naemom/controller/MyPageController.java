package kr.dbp.naemom.controller;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.service.MyPageService;
import kr.dbp.naemom.utils.MessageUtils;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.Member_profileVO;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService myPageService;
	
	@RequestMapping(value = "/mypage/main")
	public ModelAndView home(ModelAndView mv) {
		MemberVO user = new MemberVO();
		//임시 멤버객체생성
		user= CreteTmpUser(user);
		user = myPageService.getUserInfo(user);
		user.setMe_session_limit(new Date(System.currentTimeMillis() - 24 * 60 * 60 * 1000));
		Member_profileVO profileImg = myPageService.getProfileImg(user.getMe_id());
		user.setMember_profile(profileImg);
		mv.addObject("user",user);
		mv.setViewName("/mypage/main");
		return mv;
	}
	
	@RequestMapping(value = "/mypage/profile", method = RequestMethod.GET)
	public ModelAndView myPage(ModelAndView mv) {
		MemberVO user = new MemberVO();
		//임시 멤버객체생성
		user= CreteTmpUser(user);
		user = myPageService.getUserInfo(user);
		user.setMe_session_limit(new Date(System.currentTimeMillis() - 24 * 60 * 60 * 1000));
		Member_profileVO profileImg = myPageService.getProfileImg(user.getMe_id());
		user.setMember_profile(profileImg);
		mv.addObject("user",user);
		mv.setViewName("/mypage/profile");
		return mv;
		
	}@RequestMapping(value = "/mypage/profile", method = RequestMethod.POST)
	public ModelAndView myPagePost(ModelAndView mv, MemberVO member, HttpSession session, HttpServletResponse response) {
		System.out.println(member);
		boolean res = myPageService.updateMember(member);
		if(!res) {
			MessageUtils.alertAndMovePage(response, 
					"회원정보 수정 실패!!", 
					"/naemom", "/mypage/profile");
		}else {
			MessageUtils.alertAndMovePage(response, 
					"회원정보 수정 성공!!", 
					"/naemom", "/mypage/main");
		}
		
		return mv;
	}
	
	//임시 멤버객체생성
	private MemberVO CreteTmpUser(MemberVO user) {
		user.setMe_authority(10);
		user.setMe_gender("남");
		user.setMe_detail_address("오벨리스크 401호");
		user.setMe_id("abcd");
		user.setMe_ma_email("zkoiu@naver.com");
		user.setMe_mileage(100);
		user.setMe_nickname("건우");
		user.setMe_phone("010-3151-7063");
		user.setMe_street_address("서울시 은평구 가좌로 165");
		user.setMe_registered_address("서울시 은평구 응암동 375-2");
		user.setMe_pw("1q2w3e4r!");
		return user;
	}
	
	
	
}
