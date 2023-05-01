package kr.dbp.naemom.interceptor;



import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.dbp.naemom.service.MyPageService;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.Member_profileVO;

public class MypageInterceptor extends HandlerInterceptorAdapter  {
	
	 	@Autowired
	    private MyPageService myPageService;

	    @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	            throws Exception {
	        HttpSession session = request.getSession();
	        if (session.getAttribute("user") == null) {
	            MemberVO user = new MemberVO();
	            //임시 멤버객체생성
	            user = myPageService.getUserInfo(user);
	            user.setMe_session_limit(new Date(System.currentTimeMillis() - 24 * 60 * 60 * 1000));
	            Member_profileVO profileImg = myPageService.getProfileImg(user.getMe_id());
	            
	            if(profileImg != null)user.setMember_profile(profileImg);
	            
	            session.setAttribute("user", user);
	            Integer expirationMileage = myPageService.getexpirationMileage(user.getMe_id());
	            if(expirationMileage != null)user.setExpirationMileage(expirationMileage);
	            else user.setExpirationMileage(0);
	        }
	        return true;
	    }

	
}