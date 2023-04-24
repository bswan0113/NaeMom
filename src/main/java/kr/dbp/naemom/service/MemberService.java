package kr.dbp.naemom.service;

import java.util.Date;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.dbp.naemom.vo.MemberVO;

@Service
public interface MemberService {

	    boolean signup(MemberVO member);
		 
		MemberVO login(MemberVO member);
		
		void updateMemberBySession(MemberVO user);
		
		boolean checkId(MemberVO user);
		
		boolean checkEm(MemberVO user);
		
		MemberVO getMemberBySession(String me_session_id);
		//추가	

		String findMemberId(MemberVO member);

		String findMemberPw(String me_name, String me_ma_email, java.util.Date me_birth, String me_id);

		void updateMemberPassword(MemberVO member);		

		void updateMemberPassword(String randomPassword, String me_id);

		
		

		
}
