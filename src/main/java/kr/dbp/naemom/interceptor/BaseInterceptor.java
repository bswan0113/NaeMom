package kr.dbp.naemom.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.dbp.naemom.service.AdminService;

public class BaseInterceptor extends HandlerInterceptorAdapter  {
	
	@Autowired
	AdminService adminService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		int count=0;
		if(cookies != null && cookies.length>0) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("clientCookie")) {
					count++;
				}
			}
		}
		if(count==0) {
			int time = 60 * 60 * 24 * 7;
			Cookie clientCookie = new Cookie("clientCookie",session.getId());
			clientCookie.setPath("/");
			clientCookie.setMaxAge(time);
			response.addCookie(clientCookie);
			if(adminService.getVisit(session.getId())) {
				adminService.addVisit(session.getId());
			}
		}
		return true;
	}
}
