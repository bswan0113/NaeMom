package kr.dbp.naemom.dao;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.Member_profileVO;

public interface MyPageDAO {

	MemberVO getUserInfo(@Param("me_id")String me_id);

	int updateMember(@Param("me")MemberVO member);


	boolean insertProfileImg(@Param("mf")Member_profileVO upload, @Param("me_id")String me_id);

	int updateProfileImg(@Param("mf")Member_profileVO upload);

	Member_profileVO getProfileImg(@Param("me_id")String me_id);



	
}
