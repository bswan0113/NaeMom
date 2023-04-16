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
import kr.dbp.naemom.vo.BuyListVO;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.Member_profileVO;
import kr.dbp.naemom.vo.MileageVO;
import kr.dbp.naemom.vo.ReviewVO;
import kr.dbp.naemom.vo.WishVO;
import kr.dbp.naemom.vo.qnaVO;
import kr.dbp.naemom.vo.qna_AnswerVO;

@Controller
public class MyPageController {
	
	@Autowired
	MyPageService myPageService;
	
	@RequestMapping(value = "/mypage/main")
	public ModelAndView home(ModelAndView mv, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("userInfo");
		mv.addObject("user",user);
		mv.setViewName("/mypage/main");
		return mv;
	}
	
	@RequestMapping(value = "/mypage/profile", method = RequestMethod.GET)
	public ModelAndView myPage(ModelAndView mv, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("userInfo");
		
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
		MemberVO user = (MemberVO) session.getAttribute("userInfo");
		
		ArrayList<qnaVO> qnaList = myPageService.getQnaList(user.getMe_id(), cri);
		int totalCount = myPageService.getQnaCount(user.getMe_id()).size();
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		mv.addObject("user",user);
		mv.addObject("pm", pm);
		mv.addObject("qnaList", qnaList);
		mv.setViewName("/mypage/qnaList");
		return mv;
	}
	
	@RequestMapping(value = "/mypage/reviewList")
	public ModelAndView reviewList(ModelAndView mv, HttpSession session, Criteria cri) {
		if(cri==null) cri=new Criteria();
		MemberVO user = (MemberVO) session.getAttribute("userInfo");
		
		ArrayList<ReviewVO> review = myPageService.getReviewList(cri, user.getMe_id());
		int totalCount = myPageService.getReviewCount(user.getMe_id());
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		
		for(int i=0; i<review.size(); i++) {
			review.get(i).setPd_title(myPageService.getPdTitle(review.get(i).getRe_pd_num()));
		}
		
		mv.addObject("user",user);
		mv.addObject("pm", pm);
		mv.addObject("review", review);
		mv.setViewName("/mypage/reviewList");
		return mv;
	}
	
	
	@RequestMapping(value = "/mypage/qnaInsert", method=RequestMethod.GET)
	public ModelAndView qnaInsert(ModelAndView mv, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("userInfo");
		
		mv.addObject("user",user);
		mv.setViewName("/mypage/qnaInsert");
		return mv;
	}
	@RequestMapping(value = "/mypage/qnaInsert", method=RequestMethod.POST)
	public ModelAndView qnaInsertPost(ModelAndView mv, HttpSession session, qnaVO qna, MultipartFile[] files, HttpServletResponse response) {
		MemberVO user = (MemberVO) session.getAttribute("userInfo");
		mv.addObject("user",user);
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
		MemberVO user = (MemberVO) session.getAttribute("userInfo");
		
		qnaVO qna = myPageService.getQna(qa_num);
		qna_AnswerVO answer = myPageService.getAnswer(qa_num);
		mv.addObject("answer", answer);
		mv.addObject("user",user);
		mv.addObject("qna", qna);
		mv.setViewName("/mypage/qnaDetail");
		return mv;
	}
	
	@RequestMapping(value = "/mypage/courseList")
	public ModelAndView couserList(ModelAndView mv, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("userInfo");
		mv.addObject("user",user);
		
		mv.setViewName("/mypage/courseList");
		return mv;
	}
	@RequestMapping(value = "/mypage/reserveList")
	public ModelAndView reserveList(ModelAndView mv, HttpSession session, Criteria cri) {
		if(cri==null) cri = new Criteria();
		MemberVO user = (MemberVO) session.getAttribute("userInfo");
		ArrayList<BuyListVO> buyList = myPageService.getBuyList(user.getMe_id(),cri);
		
		int totalCount = myPageService.getBuyListCount(user.getMe_id());
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		mv.addObject("pm", pm);
		mv.addObject("buyList", buyList);
		mv.addObject("user",user);
		mv.setViewName("/mypage/reserveList");
		return mv;
	}
	@RequestMapping(value = "/mypage/mileageList")
	public ModelAndView mileageList(ModelAndView mv, HttpSession session, Criteria cri) {
		if(cri==null) cri=new Criteria();
		MemberVO user = (MemberVO) session.getAttribute("userInfo");
		ArrayList<MileageVO> mileageList = myPageService.getMilageList(user.getMe_id(), cri);
		int totalCount = myPageService.getMileageCount(user.getMe_id());
		
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		mv.addObject("pm", pm);
		mv.addObject("mile", mileageList);
		mv.addObject("user",user);
		mv.setViewName("/mypage/mileageList");
		return mv;
	}

	@RequestMapping(value = "/mypage/wishList")
	public ModelAndView wishList(ModelAndView mv, HttpSession session, Criteria cri) {
		if(cri==null) cri= new Criteria();
		
		MemberVO user = (MemberVO) session.getAttribute("userInfo");
		ArrayList<WishVO> wishList = myPageService.getWishList(user.getMe_id(), cri);
		int totalCount = myPageService.getWishCount(user.getMe_id());
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		for(int i=0; i<wishList.size(); i++) {
			wishList.get(i).setProduct(myPageService.getProductByPdNum(wishList.get(i).getWi_pd_num()));
			wishList.get(i).getProduct().setFile(myPageService.getFileByPdNum(wishList.get(i).getWi_pd_num()));
		}
		mv.addObject("user",user);
		mv.addObject("pm", pm);		
		mv.addObject("wishList", wishList);
		
		mv.setViewName("/mypage/wishList");
		return mv;
	}
	
	@RequestMapping(value = "/mypage/deleteQna/{qa_num}", method =RequestMethod.GET)
	public ModelAndView qnaDelete(ModelAndView mv, HttpSession session, @PathVariable("qa_num")int qa_num, HttpServletResponse response) {
		MemberVO user = (MemberVO) session.getAttribute("userInfo");
		mv.addObject("user",user);
		
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
	

	
	
	
}
