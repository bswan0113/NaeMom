package kr.dbp.naemom.controller;


import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.pagination.PageMaker;
import kr.dbp.naemom.service.MyPageService;
import kr.dbp.naemom.utils.MessageUtils;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.Member_profileVO;
import kr.dbp.naemom.vo.Qna_Sub_categoryVO;
import kr.dbp.naemom.vo.qnaVO;
import kr.dbp.naemom.vo.qna_AnswerVO;

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
	
	@RequestMapping(value = "/mypage/qnaList")
	public ModelAndView qnaList(ModelAndView mv, HttpSession session, Criteria cri) {
		if(cri==null) cri=new Criteria();
		MemberVO user = new MemberVO();
		//임시 멤버객체생성
		user= CreteTmpUser(user);
		user = myPageService.getUserInfo(user);
		user.setMe_session_limit(new Date(System.currentTimeMillis() - 24 * 60 * 60 * 1000));
		Member_profileVO profileImg = myPageService.getProfileImg(user.getMe_id());
		user.setMember_profile(profileImg);
		
		ArrayList<qnaVO> qnaList = myPageService.getQnaList(user.getMe_id(), cri);
		int totalCount = myPageService.getQnaCount(user.getMe_id()).size();
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		mv.addObject("pm", pm);
		mv.addObject("qnaList", qnaList);
		mv.addObject("user",user);
		mv.setViewName("/mypage/qnaList");
		return mv;
	}
	
	
	@RequestMapping(value = "/mypage/qnaInsert", method=RequestMethod.GET)
	public ModelAndView qnaInsert(ModelAndView mv, HttpSession session) {
		MemberVO user = new MemberVO();
		//임시 멤버객체생성
		user= CreteTmpUser(user);
		user = myPageService.getUserInfo(user);
		user.setMe_session_limit(new Date(System.currentTimeMillis() - 24 * 60 * 60 * 1000));
		Member_profileVO profileImg = myPageService.getProfileImg(user.getMe_id());
		user.setMember_profile(profileImg);
		mv.addObject("user",user);
		mv.setViewName("/mypage/qnaInsert");
		return mv;
	}
	@RequestMapping(value = "/mypage/qnaInsert", method=RequestMethod.POST)
	public ModelAndView qnaInsertPost(ModelAndView mv, HttpSession session, qnaVO qna, MultipartFile[] files, HttpServletResponse response) {
		MemberVO user = new MemberVO();
		user= CreteTmpUser(user);
		user = myPageService.getUserInfo(user);
		user.setMe_session_limit(new Date(System.currentTimeMillis() - 24 * 60 * 60 * 1000));
		Member_profileVO profileImg = myPageService.getProfileImg(user.getMe_id());
		user.setMember_profile(profileImg);
		qna.setQa_me_id(user.getMe_id());
		boolean res = myPageService.insertQna(qna, files);
		if(res) {
			MessageUtils.alertAndMovePage(response, 
					"문의가 접수되었습니다", 
					"/naemom", "/mypage/qnaList");
		}else {
			MessageUtils.alertAndMovePage(response, 
					"문의 등록중 오류가 발생하였습니다.", 
					"/naemom", "/mypage/qnaInsert");
		}
		return mv;
	}
	
	@RequestMapping(value = "/mypage/qnaDetail/{qa_num}")
	public ModelAndView qnaInsertPost(ModelAndView mv, HttpSession session, @PathVariable("qa_num")int qa_num) {
		MemberVO user = new MemberVO();
		user= CreteTmpUser(user);
		user = myPageService.getUserInfo(user);
		user.setMe_session_limit(new Date(System.currentTimeMillis() - 24 * 60 * 60 * 1000));
		Member_profileVO profileImg = myPageService.getProfileImg(user.getMe_id());
		user.setMember_profile(profileImg);
		
		qnaVO qna = myPageService.getQna(qa_num);
		qna_AnswerVO answer = myPageService.getAnswer(qa_num);
		mv.addObject("answer", answer);
		mv.addObject("qna", qna);
		mv.setViewName("/mypage/qnaDetail");
		return mv;
	}
	
	@RequestMapping(value = "/mypage/deleteQna/{qa_num}", method =RequestMethod.GET)
	public ModelAndView qnaDelete(ModelAndView mv, HttpSession session, @PathVariable("qa_num")int qa_num, HttpServletResponse response) {
		MemberVO user = new MemberVO();
		user= CreteTmpUser(user);
		user = myPageService.getUserInfo(user);
		user.setMe_session_limit(new Date(System.currentTimeMillis() - 24 * 60 * 60 * 1000));
		Member_profileVO profileImg = myPageService.getProfileImg(user.getMe_id());
		user.setMember_profile(profileImg);
		
		boolean res= myPageService.deleteQna(qa_num);
		if(res) {
			MessageUtils.alertAndMovePage(response, 
					"문의가 삭제되었습니다", 
					"/naemom", "/mypage/qnaList");
		}else {
			MessageUtils.alertAndMovePage(response, 
					"문의 삭제에 실패하였습니다.", 
					"/naemom", "/mypage/qnaDetail/"+qa_num);
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
