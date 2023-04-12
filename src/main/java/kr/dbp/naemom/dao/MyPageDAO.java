package kr.dbp.naemom.dao;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.vo.MemberVO;

public interface MyPageDAO {

	MemberVO getUserInfo(@Param("me_id")String me_id);


	
}
