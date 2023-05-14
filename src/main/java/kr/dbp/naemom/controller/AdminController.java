package kr.dbp.naemom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.bootpay.Bootpay;
import kr.dbp.naemom.bootpay.request.Cancel;
import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.pagination.PageMaker;
import kr.dbp.naemom.service.AdminService;
import kr.dbp.naemom.utils.ApiKey;
import kr.dbp.naemom.utils.MessageUtils;
import kr.dbp.naemom.vo.Buy_listVO;
import kr.dbp.naemom.vo.CourseVO;
import kr.dbp.naemom.vo.Hash_tagVO;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.PayDTO;
import kr.dbp.naemom.vo.ReviewCommentVO;
import kr.dbp.naemom.vo.ReviewVO;
import kr.dbp.naemom.vo.qnaVO;
import kr.dbp.naemom.vo.qna_AnswerVO;


@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	String api = new ApiKey().getBootpayKim();
	

	@RequestMapping(value = "/admin/list/qnaList")
	public ModelAndView qnaList(ModelAndView mv, Criteria cri) {
		
		ArrayList<qnaVO> qList = adminService.getQList(cri);
		int totalCount = adminService.getCountQList();
		PageMaker pm = new PageMaker(totalCount, 5, cri);
		
		mv.addObject("qnaList", qList);
		mv.addObject("pm", pm);
		mv.setViewName("/admin/list/qnaList");
		return mv;
	}

	@RequestMapping(value = "/admin/list/qnaAnswer/{qa_num}", method = RequestMethod.GET)
	public ModelAndView qnaAnswer(ModelAndView mv, @PathVariable("qa_num")int qa_num) {
		qnaVO qna = adminService.getQnaByNum(qa_num);
		mv.addObject("qna", qna);
		mv.setViewName("/admin/list/qnaAnswer");
		return mv;
	}
	
	@RequestMapping(value = "/admin/list/qnaAnswer", method = RequestMethod.POST)
	public ModelAndView qnaAnswerPost(ModelAndView mv, qna_AnswerVO answer) {
		boolean res = adminService.insertAnswer(answer);
		if(res) {
			
			mv.setViewName("redirect:/admin/list/qnaList");
		}else {
			mv.setViewName("redirect:/admin/list/qnaAnswer/"+answer.getQaa_qa_num());
		}
		return mv;
	}

	@RequestMapping(value = "/admin/list/reportList")
	public ModelAndView reportList(ModelAndView mv) {
		ArrayList<ReviewCommentVO> rcl = adminService.getReportedRc();
		ArrayList<ReviewVO> rel = adminService.getReportedRe();
		ArrayList<CourseVO> col = adminService.getReportedCo();

		mv.addObject("col", col);
		mv.addObject("rcl", rcl);
		mv.addObject("rel", rel);
		mv.setViewName("/admin/list/reportList");
		return mv;
	}
	
	@RequestMapping(value = "/admin/list/userList")
	public ModelAndView userList(ModelAndView mv, Criteria cri) {
		if(cri==null) cri = new Criteria();
		int totalCount = adminService.getUserCount();
		PageMaker pm = new PageMaker(totalCount, 10, cri);
		ArrayList<MemberVO> userList = adminService.getUserList(cri);
		
		mv.addObject("ul", userList);
		mv.addObject("pm", pm);
		mv.setViewName("/admin/list/userList");
		return mv;
	}

   @RequestMapping(value = "/mypage/profile/{me_id}", method = RequestMethod.GET)
   public ModelAndView adminIntoUserPage(ModelAndView mv,   @PathVariable("me_id")String me_id,HttpSession session, HttpServletResponse response) {
      MemberVO auth =(MemberVO)session.getAttribute("user");
      if(auth.getMe_authority()<10) {
         MessageUtils.alertAndMovePage(response, 
               "권한이 없습니다!", 
               "/naemom", "");
      }
      MemberVO user = adminService.getUserInfo(me_id);
      mv.addObject("user",user);
      mv.setViewName("/mypage/profile");
      return mv;
      
   }
   @RequestMapping(value = "/mypage/reserveList/{bl_me_id}", method = RequestMethod.GET)
   public ModelAndView adminIntoUserBuyList(ModelAndView mv,Criteria cri,   @PathVariable("bl_me_id")String bl_me_id,HttpSession session, HttpServletResponse response) {
      MemberVO auth =(MemberVO)session.getAttribute("user");
      if(auth.getMe_authority()<10) {
         MessageUtils.alertAndMovePage(response, 
               "권한이 없습니다!", 
               "/naemom", "");
      }
      MemberVO user = adminService.getUserInfo(bl_me_id);
      if(cri==null) cri = new Criteria();
      ArrayList<Buy_listVO> buyList = adminService.getBuyList(bl_me_id, cri);
      int totalCount = adminService.getPaymentCount(bl_me_id);
      PageMaker pm = new PageMaker(totalCount, 5, cri);
      mv.addObject("pm", pm);
      mv.addObject("buyList", buyList);
      mv.addObject("user",user);
      mv.setViewName("/mypage/reserveList");
      return mv;
      
   }

	
	@RequestMapping(value = "/admin/insert/hashtag/{pd_num}/{pd_title}")
	public ModelAndView adminIntoUserPage(ModelAndView mv, @PathVariable("pd_num")int pd_num, @PathVariable("pd_title")String pd_title) {
		ArrayList<Hash_tagVO> regi = adminService.getHashList(pd_num);
		
		mv.addObject("pd_num", pd_num);
		mv.addObject("title", pd_title);
		mv.addObject("regi", regi);
		mv.setViewName("/admin/insert/insertHashtag");
		return mv;
		
	}
	
	
	@RequestMapping(value = "/admin/list/buyCancelList")
	public ModelAndView buyCancelList(ModelAndView mv, Criteria cri) {
		if(cri==null) cri = new Criteria();
		ArrayList<Buy_listVO> list = adminService.getAllBuyList(cri);
		int totalCount = adminService.getBuyListCount();
		PageMaker pm = new PageMaker(totalCount, 10, cri);
		mv.addObject("list", list);
		mv.addObject("pm", pm);
		mv.setViewName("/admin/list/buyCancelList");
		return mv;
	}
	@RequestMapping(value = "/admin/list/buyCancelList/{state}")
	public ModelAndView buyCancelList(ModelAndView mv, Criteria cri, @PathVariable String state) {
		if(cri==null) cri = new Criteria();
		ArrayList<Buy_listVO> list = adminService.getAllBuyListByState(cri,state);
		int totalCount = adminService.getBuyListCountByState(state);
		PageMaker pm = new PageMaker(totalCount, 10, cri);
		mv.addObject("list", list);
		mv.addObject("pm", pm);
		mv.setViewName("/admin/list/buyCancelList");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/admin/cancelBuyList", method=RequestMethod.POST)
	public Map<String, Object> courseSearchProduct(@RequestBody PayDTO cancelItem) {
		Map<String, Object> map = new HashMap<String, Object>();
		Buy_listVO tmp = adminService.getBuyListByNum(cancelItem.getOrder_id());
		Cancel cancel = new Cancel();
		cancel.receiptId = tmp.getBl_receipt_id();
		cancel.name = cancelItem.getOrder_name();
		cancel.reason = cancelItem.getReContent();
		try {
			
			Bootpay bootpay = new Bootpay("64424e90922c3400236cdc6d", api);
			bootpay.getAccessToken();
			HttpResponse res = bootpay.receiptCancel(cancel);
            String str = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
            map.put("str", str);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/admin/cancelListAndReserve", method=RequestMethod.POST)
	public Map<String, Object> cancelListAndReserve(@RequestBody String bl_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		bl_num = bl_num.replaceAll("[^\\w+]", "");
		adminService.updateBuyList(bl_num);
		
		return map;
	}
	
}