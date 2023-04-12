package kr.dbp.naemom.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.LikeVO;
import kr.dbp.naemom.vo.ReportVO;
import kr.dbp.naemom.vo.ReviewCommentVO;
import kr.dbp.naemom.vo.ReviewVO;

public interface ReviewDAO {

	boolean insertReview(@Param("re")ReviewVO review);

	void insertFile(@Param("fi")FileVO fileVo);

	int selectTotalCountReviewList(@Param("pd_num")int pd_num);

	ArrayList<ReviewVO> selectReviewList(@Param("pd_num")int pd_num, @Param("cri")Criteria cri);

	ArrayList<FileVO> getReviewFileList(@Param("pd_num")int pd_num, @Param("category")String category);

	FileVO getFileByReview(@Param("re_num")int re_num, @Param("review")String string);

	int deleteReview(@Param("me_id")String me_id, @Param("re_num")int re_num);

	ArrayList<ReviewCommentVO> selectRCommentList(@Param("rc_re_num")int rc_re_num, @Param("cri")Criteria cri);

	int selectTotalCountReviewCommentList(@Param("rc_re_num")int rc_re_num);

	boolean insertReviewComment(@Param("rc")ReviewCommentVO reviewComment, @Param("rc_me_id")String me_id);

	boolean deleteReviewComment(@Param("rc_me_id")String me_id, @Param("rc_num")int rc_num);

	boolean insertReportReview(@Param("rep")ReportVO report, @Param("rep_me_id")String me_id);

	int getReportCount(@Param("re")ReviewVO review, @Param("rep_table")String string);

	boolean insertReviewLike(@Param("li")LikeVO like);

	int getLikeCount(@Param("li_table_key")Integer re_num, @Param("li_updown")int i, @Param("li_table")String string);

	boolean updateReview(@Param("re")ReviewVO review);

	boolean updateFile(@Param("fi")FileVO fileVo);

	LikeVO selectReview(@Param("li")LikeVO like);

	LikeVO getReviewLike(@Param("re")ReviewVO review, @Param("review")String string);

	boolean deleteReviewLike(@Param("li")LikeVO like);

	int checkReport(@Param("re")ReportVO report);






}
