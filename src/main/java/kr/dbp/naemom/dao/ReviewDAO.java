package kr.dbp.naemom.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.ReviewVO;

public interface ReviewDAO {

	boolean insertReview(@Param("re")ReviewVO review);

	void insertFile(@Param("fi")FileVO fileVo);

	int selectTotalCountReviewList(@Param("pd_num")int pd_num);

	ArrayList<ReviewVO> selectReviewList(@Param("pd_num")int pd_num, @Param("cri")Criteria cri);

	ArrayList<FileVO> getReviewFileList(@Param("pd_num")int pd_num, @Param("category")String category);

	FileVO getFileByReview(@Param("re_num")int re_num, @Param("review")String string);

	int deleteReview(@Param("me_id")String me_id, @Param("re_num")int re_num);


}
