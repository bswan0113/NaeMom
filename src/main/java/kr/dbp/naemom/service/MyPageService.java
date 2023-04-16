package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.Member_profileVO;
import kr.dbp.naemom.vo.Qna_Sub_categoryVO;
import kr.dbp.naemom.vo.ReviewVO;
import kr.dbp.naemom.vo.qnaVO;
import kr.dbp.naemom.vo.qna_AnswerVO;

public interface MyPageService {

	MemberVO getUserInfo(MemberVO user);

	boolean updateMember(MemberVO member);

	boolean updateProfileImg(MultipartFile file, String me_id);

	Member_profileVO getProfileImg(String me_id);

	ArrayList<qnaVO> getQnaCount(String me_id);

	ArrayList<qnaVO> getQnaList(String me_id, Criteria cri);

	ArrayList<Qna_Sub_categoryVO> getQnaCategory();

	boolean insertQna(qnaVO qna, MultipartFile[] files);

	qnaVO getQna(int qa_num);

	qna_AnswerVO getAnswer(int qa_num);

	boolean deleteQna(int qa_num);

	ArrayList<ReviewVO> getReviewList(Criteria cri, String me_id);

	int getReviewCount(String me_id);

	String getPdTitle(int re_pd_num);



}
