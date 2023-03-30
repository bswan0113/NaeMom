package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.ReviewCommentVO;
import kr.dbp.naemom.vo.ReviewVO;

public interface ReviewService {

	int insertReview(ReviewVO review);

	boolean insertReviewFile(int re_num, MultipartFile[] uploadFile);

	ArrayList<ReviewVO> getReviewList(int pd_num, Criteria cri);

	int getTotalCountReviewList(int pd_num);

	boolean deleteReview(String me_id, ReviewVO review);

	ArrayList<ReviewCommentVO> getRCommentList(int rc_re_num, Criteria cri);

	int getTotalCountReviewCommentList(int rc_re_num);

	boolean insertReviewComment(ReviewCommentVO reviewComment, String me_id);

	boolean deleteReviewComment(ReviewCommentVO reviewComment, String me_id);





}
