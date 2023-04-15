package kr.dbp.naemom.service;

import java.sql.Date;

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
		

		String findid(String me_name, String me_email, Date me_birthday);

	
}
