package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.ReviewVO;

public interface ReviewService {

	int insertReview(ReviewVO review);

	boolean insertReviewFile(int re_num, int re_pd_num, MultipartFile[] uploadFile);

	ArrayList<ReviewVO> getReviewList(int pd_num, Criteria cri);

	int getTotalCountReviewList(int pd_num);



}
