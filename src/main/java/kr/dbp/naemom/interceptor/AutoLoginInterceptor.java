package kr.dbp.naemom.interceptor;

import java.sql.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import kr.dbp.naemom.service.MemberService;
import kr.dbp.naemom.vo.MemberVO;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter  {
	
	@Autowired
	MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null) {
			Cookie cookie = WebUtils.getCookie(request, "dbpCookie");
			if(cookie != null) {
				String me_session_id = cookie.getValue();
				user = memberService.getMemberBySession(me_session_id);
				if(user != null) {
					session.setAttribute("user", user);
				}
					
			}
		}
		
		return true;
	}
	
	@Override
	public void postHandle(
	    HttpServletRequest request, 
	    HttpServletResponse response, 
	    Object handler, 
	    ModelAndView modelAndView)
	    throws Exception {
		HttpSession session = request.getSession();
		Cookie cookie = WebUtils.getCookie(request, "clientCookie");
		if(cookie == null) {
			cookie = new Cookie("clientCookie", session.getId());
        	//1주일
        	int time = 60 * 30;
        	cookie.setPath("/");
        	
        	response.addCookie(cookie);
				
		}
	}
}

