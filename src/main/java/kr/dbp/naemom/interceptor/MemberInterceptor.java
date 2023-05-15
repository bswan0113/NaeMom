package kr.dbp.naemom.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.dbp.naemom.vo.MemberVO;

public class MemberInterceptor extends HandlerInterceptorAdapter  {

	@Override
	public boolean preHandle(HttpServletRequest request, 
	        HttpServletResponse response, 
	        Object handler)
	        throws Exception {
	    HttpSession session = request.getSession();
	    MemberVO user = (MemberVO) session.getAttribute("user");
	    
	    // 로그인이 되어있을 경우 /login, /signup 접속 제한
	    if (user != null && (request.getRequestURI().equals(request.getContextPath() + "/login") ||
	                         request.getRequestURI().equals(request.getContextPath() + "/signup") ||
	                         request.getRequestURI().equals(request.getContextPath() + "/findid") ||
	                         request.getRequestURI().equals(request.getContextPath() + "/findpw"))) {
	        response.sendRedirect(request.getContextPath() + "/");
	        return false;
	    }
	    
	    return true;
	}
}