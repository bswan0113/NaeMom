package kr.dbp.naemom.service;



import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.MemberDAO;
import kr.dbp.naemom.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	MemberDAO memberDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	
	public boolean signup(MemberVO member) {
	    // 회원정보 유효성 검사
	    if (member == null) {
	        return false;
	    }
	    String idRegex = "^[a-z][a-zA-Z0-9!@#]{5,13}$";
	    String pwRegex = "^[a-zA-Z0-9!@#$]{8,16}$";

	    if (member.getMe_id() == null || !Pattern.matches(idRegex, member.getMe_id())) {
	        return false;
	    }
	    if (member.getMe_pw() == null || !Pattern.matches(pwRegex, member.getMe_pw())) {
	        return false;
	    }
	    if (member.getMe_ma_email() == null) {
	        return false;
	    }
	    if (member.getMe_birthday() == null) {
	        return false;
	    }

	    // 비밀번호 암호화
	    String encPw = passwordEncoder.encode(member.getMe_pw());
	    member.setMe_pw(encPw);

	    // 회원가입
	    int result = memberDao.insertMember(member);
	    return result > 0;
	}
	@Override
	public MemberVO login(MemberVO member) {
		if(member == null || member.getMe_id() == null 
			|| member.getMe_pw() == null)
			return null;
		MemberVO dbMember = memberDao.selectMemberById(member.getMe_id());
		if(dbMember == null)
			return null;
		if(passwordEncoder.matches(member.getMe_pw(), dbMember.getMe_pw()))
			return dbMember;
		return null;
	}
	@Override
	public boolean checkId(MemberVO user) {
		if(user == null || 
			user.getMe_id() == null || 
			user.getMe_id().trim().length() == 0)
			return false;
		return memberDao.selectMemberById(user.getMe_id()) == null;
	}
	@Override
	public boolean checkEm(MemberVO user) {
		if(user == null || 
			user.getMe_ma_email() == null || 
			user.getMe_ma_email().trim().length() == 0)
			return false;
		return memberDao.selectMemberByEmail(user.getMe_ma_email()) == null;
	}

	@Override
	public void updateMemberBySession(MemberVO user) {
		if(user == null)
			return;
		memberDao.updateSession(user);
	}
	@Override
	public MemberVO getMemberBySession(String me_session_id) {
		return memberDao.selectMemberBySession(me_session_id);
	}
	//추가

	@Autowired
	private MemberDAO memberDAO;
	

	@Override
	public String findMemberId(MemberVO member) {
		return memberDAO.findMemberId(member);
	}
	
	@Override
	public String findMemberPw(String me_name, String me_ma_email, Date me_birthday, String me_id) {
		
		return memberDAO.findMemberPw(me_name, me_ma_email, me_birthday, me_id);
	}
	@Override
	public void updateMemberPassword(MemberVO member) {
		 String encPw = passwordEncoder.encode(member.getMe_pw());
		    member.setMe_pw(encPw);
	    memberDAO.updateMemberPassword(member);
	    
	}

	
	@Override
	public void updateMemberPassword(String randomPassword, String me_id) {
	    MemberVO member = memberDAO.selectMemberById(me_id);
	    String encPw = passwordEncoder.encode(randomPassword);
	    member.setMe_pw(encPw);

	
	    memberDAO.updateMemberPassword(member);	   

	}
	

	
	
}
