package kr.dbp.naemom.interceptor;



import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.dbp.naemom.service.MyPageService;
import kr.dbp.naemom.utils.MessageUtils;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.Member_profileVO;

public class MypageInterceptor extends HandlerInterceptorAdapter  {
	
	 	@Autowired
	    private MyPageService myPageService;

	    @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	            throws Exception {
	        HttpSession session = request.getSession();

	        if (session.getAttribute("user") != null) {

	            MemberVO user =(MemberVO)session.getAttribute("user");

	            java.util.Date visit = user.getMe_session_limit();
	            Calendar calendar = Calendar.getInstance();
	            calendar.setTime(visit);
	            calendar.add(Calendar.DATE, -7);
	            java.util.Date sixDaysAgo = calendar.getTime();

	            user.setMe_session_limit(sixDaysAgo);
	            
	            Member_profileVO profileImg = myPageService.getProfileImg(user.getMe_id());
	            if(profileImg != null)user.setMember_profile(profileImg);	            
	            session.setAttribute("user", user);
	            Integer expirationMileage = myPageService.getexpirationMileage(user.getMe_id());
	            if(expirationMileage != null)user.setExpirationMileage(expirationMileage);
	            else user.setExpirationMileage(0);
	            return true;
	        }
			MessageUtils.alertAndMovePage(response, 
					"로그인 해주세요!", 
					"/naemom", "/login");
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
			MemberVO user =(MemberVO)session.getAttribute("user");
			if(user != null) {
				user=myPageService.getUserInfo(user);
				session.setAttribute("user", user);
			}

		}

	
}
