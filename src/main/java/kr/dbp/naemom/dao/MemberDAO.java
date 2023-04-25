package kr.dbp.naemom.dao;

import java.util.Date;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.dbp.naemom.vo.MemberVO;
@Repository
@Mapper
public interface MemberDAO {
	@Autowired
	public void setSqlSession(SqlSession sqlSession);
	int insertMember(@Param("member") MemberVO member);
	
	MemberVO selectMemberById(@Param("me_id")String me_id);
	
	void updateSession(@Param("member")MemberVO user);	
	
	MemberVO selectMemberBySession(@Param("me_session_id")String me_session_id);
	
	MemberVO selectMemberByEmail(@Param("me_ma_email")String me_ma_email);
	
	
	String findMemberId(@Param("member")MemberVO user);
	
	String findMemberPw(@Param("me_name") String me_name,
		 @Param("me_ma_email") String me_ma_email,
		 @Param("me_birthday") Date me_birthday,
		 @Param("me_id") String me_id);
	
 	public void updateMemberPassword(MemberVO member);

	
	 
	 
}

