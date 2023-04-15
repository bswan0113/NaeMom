package kr.dbp.naemom.service;

import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.Member_profileVO;

public interface MyPageService {

	MemberVO getUserInfo(MemberVO user);

	boolean updateMember(MemberVO member);

	boolean updateProfileImg(MultipartFile file, String me_id);

	Member_profileVO getProfileImg(String me_id);



}
