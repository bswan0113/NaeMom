package kr.dbp.naemom.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.BuyListVO;
import kr.dbp.naemom.vo.CourseVO;
import kr.dbp.naemom.vo.Hash_tagVO;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.ReportManageVO;
import kr.dbp.naemom.vo.ReportVO;
import kr.dbp.naemom.vo.ReviewCommentVO;
import kr.dbp.naemom.vo.ReviewVO;
import kr.dbp.naemom.vo.qnaVO;
import kr.dbp.naemom.vo.qna_AnswerVO;

public interface AdminService {

	Integer getCountQList();

	ArrayList<qnaVO> getQList(Criteria cri);

	qnaVO getQnaByNum(int qa_num);

	boolean insertAnswer(qna_AnswerVO answer);

	int getUserCount();

	ArrayList<MemberVO> getUserList(Criteria cri);

	MemberVO getUserInfo(String me_id);

	boolean resetPw(String id);

	boolean preventUser(MemberVO user);

	ArrayList<ReportManageVO> getReportList(String id, Criteria cri);

	ArrayList<BuyListVO> getBuyList(String id, Criteria cri);

	int getReportCount(String id);

	int getPaymentCount(String id);

	int getReCount(String id);

	ArrayList<ReviewVO> getReList(String id, Criteria cri);

	int getRcCount(String id);

	ArrayList<ReviewCommentVO> getRcList(String id, Criteria cri);

	int getCoCount(String id);

	ArrayList<CourseVO> getCoList(String id, Criteria cri);

	ArrayList<CourseVO> getReportedCo();

	ArrayList<ReviewVO> getReportedRe();

	ArrayList<ReviewCommentVO> getReportedRc();

	boolean deleteReview(int num);

	boolean deleteCourse(int num);

	boolean deleteComment(int num);

	ArrayList<ReportVO> getReportByType(int num, String type);

	ArrayList<Hash_tagVO> getHashList(int pd_num);

	boolean deleteHashtag(int parseInt);

	boolean insertHashtag(int pd_num, String[] list);


}
