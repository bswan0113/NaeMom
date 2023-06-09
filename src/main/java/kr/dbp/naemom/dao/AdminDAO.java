package kr.dbp.naemom.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.BuyListVO;
import kr.dbp.naemom.vo.Buy_listVO;
import kr.dbp.naemom.vo.CourseVO;
import kr.dbp.naemom.vo.Hash_tagVO;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.MileageVO;
import kr.dbp.naemom.vo.ReportManageVO;
import kr.dbp.naemom.vo.ReportVO;
import kr.dbp.naemom.vo.ReviewCommentVO;
import kr.dbp.naemom.vo.ReviewVO;
import kr.dbp.naemom.vo.VisitedVO;
import kr.dbp.naemom.vo.qnaVO;
import kr.dbp.naemom.vo.qna_AnswerVO;

public interface AdminDAO {

	Integer getCountQList();

	ArrayList<qnaVO> getQList(@Param("cri")Criteria cri);

	qnaVO getQnaByNum(@Param("qa_num")int qa_num);

	boolean insertAnswer(@Param("qaa")qna_AnswerVO answer);

	int updateQnaState(@Param("qaa_qa_num")int qaa_qa_num);

	int getuserCount();

	ArrayList<MemberVO> getUserList(@Param("cri")Criteria cri);

	MemberVO getUserInfo(@Param("me_id")String me_id);

	int resetPw(@Param("me_id")String id, @Param("me_pw")String reset);

	int preventUser(@Param("me")MemberVO user);

	ArrayList<Buy_listVO> getBuyList(@Param("id")String id, @Param("cri")Criteria cri);

	ArrayList<ReportManageVO> getReportList(@Param("id")String id, @Param("cri")Criteria cri);

	int getReportCount(@Param("id")String id);

	int getPaymentCount(@Param("id")String id);

	int getReCount(@Param("id")String id);

	ArrayList<ReviewVO> getReList(@Param("id")String id, @Param("cri")Criteria cri);

	int getRcCount(@Param("id")String id);

	ArrayList<ReviewCommentVO> getRcList(@Param("id")String id, @Param("cri")Criteria cri);

	int getCoCount(@Param("id")String id);

	ArrayList<CourseVO> getCoList(@Param("id")String id, @Param("cri")Criteria cri);

	ArrayList<CourseVO> getReportedCo();

	ArrayList<ReviewVO> getReportedRe();

	ArrayList<ReviewCommentVO> getReportedRc();

	int deleteReview(@Param("num")int num);

	int deleteCourse(@Param("num")int num);

	int deleteComment(@Param("num")int num);

	ArrayList<ReportVO> getReportByType(@Param("table_key")int num, @Param("table")String type);

	ArrayList<Hash_tagVO> getHashtag(@Param("pd_num")int pd_num);

	int deletehashTag(@Param("hg_num")int hg_num);

	boolean insertHashtag(@Param("hg_pd_num")int pd_num, @Param("hg_name")String hash);

	ArrayList<Buy_listVO> selectAllBuyList(@Param("cri")Criteria cri);

	int selectCountBuyList();

	Buy_listVO selectBuyListByNum(@Param("bl_num")String bl_num);

	void updateBuyList(@Param("bl_num")String bl_num, @Param("state")String state);

	void deleteOrderList(@Param("bl_num")String bl_num);

	void deleteRoomOption(@Param("bl_num")String bl_num);

	void deleteFoodOption(@Param("bl_num")String bl_num);

	MileageVO selectMileage(@Param("bl_num")String bl_num);

	void deleteMileage(@Param("bl_num")String bl_num);

	void updateMember(@Param("mi")MileageVO mi);

	void addVisit(@Param("id")String id);

	void updateVisit(@Param("vi_num")int i);

	VisitedVO getVisit(@Param("id")String id);

	ArrayList<Buy_listVO> selectAllBuyListBystate(@Param("cri")Criteria cri, @Param("state")String state);

	int selectCountBuyListBystate(@Param("state")String state);
	String getAttendance(@Param("id")String me_id);

	void insetAttendance(@Param("id")String me_id);

	boolean insertAtMile(@Param("id")String me_id);






}
