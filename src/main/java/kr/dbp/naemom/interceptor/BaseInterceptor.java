package kr.dbp.naemom.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.dbp.naemom.vo.MemberVO;

public class BaseInterceptor extends HandlerInterceptorAdapter  {
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		int time = 60 * 60 * 24 * 7;
		Cookie cookie = new Cookie("clientCookie",session.getId());
		cookie.setPath("/");
		cookie.setMaxAge(time);
		response.addCookie(cookie);
		MemberVO guestUser = new MemberVO();
		guestUser.setMe_session_id(session.getId());
		return true;
	}
}
