package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.BuyListVO;
import kr.dbp.naemom.vo.CourseItemVO;
import kr.dbp.naemom.vo.CourseVO;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.Member_profileVO;
import kr.dbp.naemom.vo.MileageVO;
import kr.dbp.naemom.vo.ProductVO;
import kr.dbp.naemom.vo.Qna_Sub_categoryVO;
import kr.dbp.naemom.vo.ReviewVO;
import kr.dbp.naemom.vo.WishVO;
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

	ArrayList<WishVO> getWishList(String me_id, Criteria cri);

	int getWishCount(String me_id);

	ProductVO getProductByPdNum(int wi_pd_num);

	FileVO getFileByPdNum(int wi_pd_num);

	ArrayList<MileageVO> getMilageList(String me_id, Criteria cri);

	int getMileageCount(String me_id);

	Integer getexpirationMileage(String me_id);

	ArrayList<BuyListVO> getBuyList(String me_id, Criteria cri);

	int getBuyListCount(String me_id);

	ArrayList<CourseVO> getCourseList(Criteria cri, String me_id);

	CourseItemVO getCourseItem(int co_num);



}
