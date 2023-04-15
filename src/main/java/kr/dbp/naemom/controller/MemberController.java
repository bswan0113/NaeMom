package kr.dbp.naemom.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.service.MemberService;
import kr.dbp.naemom.vo.MemberVO;


@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/signup", method=RequestMethod.GET)
	public ModelAndView signup(ModelAndView mv) {
		mv.setViewName("/account/signup");
		return mv;
	}
	@RequestMapping(value = "/signup", method=RequestMethod.POST)
	public ModelAndView signupPost(ModelAndView mv, MemberVO member) {
		System.out.println(member);
		boolean res = memberService.signup(member);
		if(res) {
			//성공했다고 알림 메세지(추후 구현 예정)
			mv.setViewName("redirect:/");
		}else {
			//실패했다고 알림메세지(추후 구현 예정)
			mv.setViewName("redirect:/signup");
		}
		
		return mv;
	}
	
	

	@RequestMapping(value = "/signupsuc", method=RequestMethod.GET)
	public ModelAndView signupsuc(ModelAndView mv) {
		mv.setViewName("/account/signupsuc");
		return mv;
	}
	


	@RequestMapping(value = "/login", method=RequestMethod.GET)
	public ModelAndView login(ModelAndView mv, HttpServletRequest request) {
		String url = request.getHeader("Referer");
		//다른 URL을 통해 로그인페이지로 온 경우
		//(단, 로그인 실패로 인해서 login post에서 온 경우는 제외)
		if(url != null && !url.contains("login")) {
			request.getSession().setAttribute("prevURL", url);
		}
		mv.setViewName("/account/login");
		return mv;
	}
	@RequestMapping(value = "/login", method=RequestMethod.POST)
	public ModelAndView loginPost(ModelAndView mv, MemberVO member) {
		MemberVO user = memberService.login(member);
		if(user != null) { 
			mv.setViewName("redirect:/");
			//자동로그인 체크여부는 화면에서 가져오는 거지 DB에서 가져오는게 아님
			//user는 DB에서 가져온 회원 정보라 자동 로그인 여부를 알 수가 없음
			//그래서 화면에서 가져온 member에 있는 자동 로그인 여부를 user에 수정
			user.setAutoLogin(member.isAutoLogin());
		}else
			mv.setViewName("redirect:/login");
		mv.addObject("user", user);
		return mv;
	}
	
	@RequestMapping(value = "/logout", method=RequestMethod.GET)
	public ModelAndView logout(ModelAndView mv, 
			HttpSession session,
			HttpServletResponse response) throws IOException {
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user != null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그아웃 되었습니다.');location.href='/naemom'</script>");
			out.flush();
		}
		//세션에 있는 회원 정보를 삭제
		session.removeAttribute("user");
		user.setMe_session_id(null);
		memberService.updateMemberBySession(user);
		mv.setViewName("redirect:/");
		return mv;
	}
	
	  
	@RequestMapping(value = "/findid", method=RequestMethod.GET)
	public ModelAndView findid(ModelAndView mv) {
		mv.setViewName("/account/findid");
		return mv;
	}
	@RequestMapping(value = "/findidsuc", method=RequestMethod.GET)
	public ModelAndView findidsuc(ModelAndView mv) {
		mv.setViewName("/account/findidsuc");
		return mv;
	}
	@RequestMapping(value = "/findpw", method=RequestMethod.GET)
	public ModelAndView findpw(ModelAndView mv) {
		mv.setViewName("/account/findpw");
		return mv;
	}
	@RequestMapping(value = "/findpwsuc", method=RequestMethod.GET)
	public ModelAndView findpwsuc(ModelAndView mv) {
		mv.setViewName("/account/findpwsuc");
		return mv;
	}
	@RequestMapping(value = "/findidpwfail", method=RequestMethod.GET)
	public ModelAndView findidpwfail(ModelAndView mv) {
		mv.setViewName("/account/findidpwfail");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/join", method=RequestMethod.GET)
	public ModelAndView join(ModelAndView mv) {
		mv.setViewName("/account/signup");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/check/id", method=RequestMethod.POST)
	public Map<String, Object> boardLike(@RequestBody MemberVO user) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean res = memberService.checkId(user);
		map.put("res", res);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/check/em", method=RequestMethod.POST)
	public Map<String, Object> boardLikes(@RequestBody MemberVO user) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean res = memberService.checkEm(user);
		map.put("res", res);
		return map;
	}
	//추가
	@RequestMapping(value = "/findids", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView findid(@RequestParam("me_name") String me_name,
	                            @RequestParam("me_email") String me_email,
	                            @RequestParam("me_birthday") @DateTimeFormat(pattern = "yyyy-MM-dd") Date me_birthday) {
	    String me_id = memberService.findid(me_name, me_email, me_birthday);
	    ModelAndView mv = new ModelAndView();
	    if (me_id == null) {
	        mv.addObject("msg", "해당 정보와 일치하는 아이디가 없습니다.");
	    } else {
	        mv.addObject("msg", "아이디는 " + me_id + "입니다.");
	    }
	    mv.setViewName("findidsuc");
	    return mv;
	}
}



	

