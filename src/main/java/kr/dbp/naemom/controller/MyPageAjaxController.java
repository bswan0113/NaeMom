package kr.dbp.naemom.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.service.MyPageService;
import kr.dbp.naemom.service.ProductService;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.ProductVO;
import kr.dbp.naemom.vo.Qna_Sub_categoryVO;

@RestController
public class MyPageAjaxController {
	
	@Autowired
	MyPageService myPageService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value = "/mypage/pwcheck", method=RequestMethod.POST)
	public Map<String, Object> pwCheck(@RequestParam String pw, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		//MemberVO user =(MemberVO)session.getAttribute("user");
		
		//임시 유저 객체
		MemberVO user=CreteTmpUser(new MemberVO());
		
		String DBPW= myPageService.getUserInfo(user).getMe_pw();
	/*회원기능 구현전 임시 암호화 비교 메서드*/	
		if(DBPW.equals(pw))map.put("res", true);
		
	//	if(passwordEncoder.matches(pw, DBPW))map.put("res", true);
		
		return map;
	}
	
	@RequestMapping(value = "/mypage/update/profileimg", method=RequestMethod.POST)
	public Map<String, Object> pwCheck(MultipartFile File, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		//MemberVO user =(MemberVO)session.getAttribute("user");
		//임시 유저 객체
		MemberVO user=CreteTmpUser(new MemberVO());
		if(File==null || File.getOriginalFilename().trim().length()<=0) {
			map.put("res", false);
		}
		boolean res = myPageService.updateProfileImg(File,user.getMe_id());
		map.put("res", res);
		
		
		
		return map;
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
	
	@RequestMapping(value = "/mypage/getCategory", method=RequestMethod.POST)
	public Map<String, Object> getCategory(@RequestParam("category") String category) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<Qna_Sub_categoryVO> list = myPageService.getQnaCategory();
		ArrayList<Qna_Sub_categoryVO> selected = new ArrayList<Qna_Sub_categoryVO>();
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getQs_qc_category().equals(category)) {
				selected.add(list.get(i));
			}
		}
		map.put("selected", selected);
		return map;
	}
	
	@RequestMapping(value = "/qna/search", method=RequestMethod.POST)
	public Map<String, Object> qnaSearch(@RequestBody Criteria cri) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<ProductVO> list = productService.getProductList(cri);
		map.put("list", list);
		
		
		return map;
	}
	
	@RequestMapping(value = "/mypage/getThumbnail/{pd_num}", method=RequestMethod.GET)
	public Map<String, Object> searchThumbnail(@PathVariable("pd_num")int pd_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		FileVO file = productService.getThumbnail(pd_num);
		map.put("file", file);
		return map;
	}
	
	
}
