package kr.dbp.naemom.dao;

import java.sql.Date;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.vo.MemberVO;

public interface MemberDAO {

	int insertMember(@Param("member") MemberVO member);
	
	MemberVO selectMemberById(@Param("me_id")String me_id);
	
	void updateSession(@Param("member")MemberVO user);	
	
	MemberVO selectMemberBySession(@Param("me_session_id")String me_session_id);
	
	MemberVO selectMemberByEmail(@Param("me_ma_email")String me_ma_email);
	
	 MemberVO findid(String me_name, String me_email, Date me_birthday);
}

