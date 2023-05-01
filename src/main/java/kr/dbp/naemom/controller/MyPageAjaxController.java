package kr.dbp.naemom.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.service.MyPageService;
import kr.dbp.naemom.service.ProductService;
import kr.dbp.naemom.utils.GenerateRandomCode;
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
	
    @Autowired
    private JavaMailSender mailSender;
	
	@RequestMapping(value = "/mypage/pwcheck", method=RequestMethod.POST)
	public Map<String, Object> pwCheck(@RequestParam String pw, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user =(MemberVO)session.getAttribute("user");
		
		
		String DBPW= myPageService.getUserInfo(user).getMe_pw();
		if(passwordEncoder.matches(pw, DBPW))map.put("res", true);
		
		return map;
	}
	
	@RequestMapping(value = "/mypage/update/profileimg", method=RequestMethod.POST)
	public Map<String, Object> pwCheck(MultipartFile File, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user =(MemberVO)session.getAttribute("user");
		if(File==null || File.getOriginalFilename().trim().length()<=0) {
			map.put("res", false);
		}
		boolean res = myPageService.updateProfileImg(File,user.getMe_id());
		map.put("res", res);
		
		
		
		return map;
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


	    @RequestMapping(value = "/sendEmail/mypage/{oriEmail}", method=RequestMethod.GET)
	    public String sendEmail(@PathVariable("oriEmail")String oriEmail) {
	    	
	        String code = GenerateRandomCode.generateRandomCode(); // GenerateRandomCode 클래스의 메서드 사용
	        oriEmail+=".com";
	        try {
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
	            helper.setFrom("jjojjosteve@gmail.com");
	            helper.setTo(oriEmail);
	            helper.setSubject("[이메일변경] 이메일 변경인증 코드입니다.");
	            helper.setText("이메일 변경 인증 코드: " + code, true);
	            mailSender.send(message);
	            return code;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "fail";
	        }
	    }  
		@RequestMapping(value = "/change/email/{id}/{domain}/{extension}/{userId}", method=RequestMethod.GET)
		public Map<String, Object> searchThumbnail(@PathVariable("id")String id,@PathVariable("domain")String domain,@PathVariable("extension")String extension
				,@PathVariable("userId")String userId) {
			Map<String, Object> map = new HashMap<String, Object>();
			String email=id+"@"+domain+"."+extension;
			boolean res = myPageService.changeEmail(email,userId);
			map.put("res", res);
			return map;
		}

	
	
}
