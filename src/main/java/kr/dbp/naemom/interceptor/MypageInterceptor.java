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
	        if (session.getAttribute("userInfo") == null) {
	            MemberVO user = new MemberVO();
	            //임시 멤버객체생성
	            user= CreteTmpUser(user);
	            user = myPageService.getUserInfo(user);
	            user.setMe_session_limit(new Date(System.currentTimeMillis() - 24 * 60 * 60 * 1000));
	            Member_profileVO profileImg = myPageService.getProfileImg(user.getMe_id());
	            user.setMember_profile(profileImg);
	            session.setAttribute("userInfo", user);
	            int expirationMileage = myPageService.getexpirationMileage(user.getMe_id());
	            user.setExpirationMileage(expirationMileage);
	        }
	        return true;
	    }
//임시 멤버객체생성
	private MemberVO CreteTmpUser(MemberVO user) {
		user.setMe_authority(10);
		user.setMe_gender("남");
		user.setMe_detail_address("오벨리스크 401호");
		user.setMe_id("abcd");
		user.setMe_ma_email("zkoiu@naver.com");
		user.setMe_mileage(100);
		user.setMe_nickname("건우");
		user.setMe_phone("010-3151-7063");
		user.setMe_street_address("서울시 은평구 가좌로 165");
		user.setMe_registered_address("서울시 은평구 응암동 375-2");
		user.setMe_pw("1q2w3e4r!");
		return user;
	}
	
}