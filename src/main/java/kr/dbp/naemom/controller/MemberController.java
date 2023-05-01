package kr.dbp.naemom.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.net.URLDecoder;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public ModelAndView signupPost(ModelAndView mv, MemberVO member,
			HttpServletResponse response) {	
		boolean res = memberService.signup(member);
		String msg , url;
		if(res) {
			
			msg = "회원가입에 성공했습니다.";
			url = "/";
		}else {
			
			msg = "회원가입에 실패했습니다.";
			url = "/signup";
		}
		mv.addObject("url", url);
		mv.addObject("msg", msg);
		mv.setViewName("/account/message");
		return mv;
	}
	

	@RequestMapping(value = "/signupsuc", method=RequestMethod.GET)
	public ModelAndView signupsuc(ModelAndView mv) {
		mv.setViewName("/account/signupsuc");
		return mv;
	}
	


	@RequestMapping(value = "/login", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView login(ModelAndView mv, MemberVO member, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
	    String url = request.getHeader("Referer");
	    //다른 URL을 통해 로그인페이지로 온 경우
	    //(단, 로그인 실패로 인해서 login post에서 온 경우는 제외)
	    
	    if(url != null && !url.contains("login")) {
	        request.getSession().setAttribute("prevURL", url);
	    }

	    if (request.getMethod().equals("POST")) {
	        MemberVO user = memberService.login(member);
	        if(user != null && user.getMe_authority() > 0) {
	            user.setAutoLogin(member.isAutoLogin());
	            mv.addObject("msg", "로그인에 성공했습니다.");
	            mv.addObject("url", "/");
	            mv.setViewName("/account/message");
	            return mv;
	        } else {
	            mv.addObject("msg", "로그인에 실패했습니다.");
	            mv.addObject("url", "/login");
	            mv.setViewName("/account/message");
	            return mv;
	        }
	    } else {
	        mv.setViewName("/account/login");
	        return mv;
	    }
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
	

	
	@RequestMapping(value = "/findidsuc", method=RequestMethod.GET)
	public ModelAndView findidsuc(ModelAndView mv) {
		mv.setViewName("/account/findidsuc");
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
	@RequestMapping(value = "/findpw", method=RequestMethod.GET)
	public ModelAndView findpw(ModelAndView mv) {
		mv.setViewName("/account/findpw");
		return mv;
	}
	@PostMapping("/processFindPw")
	@ResponseBody
	public String processFindPw(MemberVO member, HttpServletRequest request) {

	    System.out.println(member);
	    String name = member.getMe_name();
	    String email = member.getMe_ma_email();
	    Date birth = member.getMe_birthday();
	    String id = member.getMe_id();

	    String memberPw = memberService.findMemberPw(name, email, birth, id);

	    if (memberPw == null) {
	        // 회원 비밀번호를 찾을 수 없는 경우
	        return null;
	    } else {
	        // 회원 비밀번호를 찾은 경우
	        try {
	            
	            String randomPassword = generateRandomPassword();
	            member.setMe_pw(randomPassword);
	            memberService.updateMemberPassword(member);

	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
	            helper.setFrom("jjojjosteve@gmail.com");
	            helper.setTo(email);
	            helper.setSubject("[Naemom] 비밀번호 찾기");
	            helper.setText("찾은 비밀번호 입니다 : " + randomPassword, true);
	            mailSender.send(message);
	            return randomPassword;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "fail";
	        }
	    }
	}

	private String generateRandomPassword() {
	    String allowedChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	    StringBuilder sb = new StringBuilder(16);

	    for (int i = 0; i < 16; i++) {
	        int randomIdx = (int) (Math.random() * allowedChars.length());
	        sb.append(allowedChars.charAt(randomIdx));
	    }

	    return sb.toString();
	}

	
	
	
	
	
	/////////////////////////////////////////////////////////
	@RequestMapping(value = "/findid", method=RequestMethod.GET)
	public ModelAndView findid(ModelAndView mv) {
		mv.setViewName("/account/findid");
		return mv;
	}
	// 아이디 찾기 페이지로 이동
	

	@Autowired
	private JavaMailSender mailSender;

	@PostMapping("/processFindId")
	@ResponseBody
	public String processFindId(MemberVO member, HttpServletRequest request) {

	    System.out.println(member);
	    String name = member.getMe_name();
	    String email = member.getMe_ma_email();
	    Date birth = member.getMe_birthday();	   
	    System.out.println("name: " + name);
	    System.out.println("email: " + email);
	    System.out.println("birth: " + birth);
	    String memberId = memberService.findMemberId(member);	   
	  
	    if (memberId == null) {
	        // 회원 아이디를 찾을 수 없는 경우
	        return null;
	    } else { 
	        // 회원 아이디를 찾은 경우	    	
	        try {
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
	            helper.setFrom("jjojjosteve@gmail.com");
	            helper.setTo(email);
	            helper.setSubject("[Naemom] 아이디 찾기");
	            helper.setText("찾은 아이디 입니다 : " + memberId.substring(0, memberId.length() - 3) + "***", true);
	            mailSender.send(message);
	            return memberId;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "fail";
	        }
	    }
	}
}
 





	

