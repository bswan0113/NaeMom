package kr.dbp.naemom.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.Member_profileVO;
import kr.dbp.naemom.vo.Qna_Sub_categoryVO;
import kr.dbp.naemom.vo.ReviewVO;
import kr.dbp.naemom.vo.qnaVO;
import kr.dbp.naemom.vo.qna_AnswerVO;

public interface MyPageDAO {

	MemberVO getUserInfo(@Param("me_id")String me_id);

	int updateMember(@Param("me")MemberVO member);


	boolean insertProfileImg(@Param("mf")Member_profileVO upload, @Param("me_id")String me_id);

	int updateProfileImg(@Param("mf")Member_profileVO upload);

	Member_profileVO getProfileImg(@Param("me_id")String me_id);

	ArrayList<qnaVO> getQnaList(@Param("me_id")String me_id, @Param("cri")Criteria cri);

	ArrayList<qnaVO> getQnaCount(@Param("me_id")String me_id);

	ArrayList<Qna_Sub_categoryVO> getCategoryList();

	boolean insertQna(@Param("qa")qnaVO qna);

	void insertFile(@Param("fi")FileVO uploadFile);

	qnaVO getQna(@Param("qa_num")int qa_num);

	qna_AnswerVO getAnswer(@Param("qa_num")int qa_num);

	int deleteQna(@Param("qa_num")int qa_num);

	ArrayList<ReviewVO> getReviewList(@Param("cri")Criteria cri, @Param("me_id")String me_id);

	int getReviewCount(@Param("me_id")String me_id);

	String getPdTitleByRePdNum(@Param("pd_num")int re_pd_num);




	
}
