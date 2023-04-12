package kr.dbp.naemom.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.dao.ReviewDAO;
import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.utils.UploadFileUtils;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.LikeVO;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.ReportVO;
import kr.dbp.naemom.vo.ReviewCommentVO;
import kr.dbp.naemom.vo.ReviewVO;

@Service
public class ReviewServiceImp implements ReviewService {

	
	@Autowired
	ReviewDAO reviewDao;
	
	String uploadPath = "D:\\uploadfiles";

	@Override
	public int insertReview(ReviewVO review) {
		if(review==null) return 0;
		if(review.getRe_content().trim().length()==0 ||
			review.getRe_me_id()==null ||
			review.getRe_rating()<=0) return 0;
		boolean res = reviewDao.insertReview(review);
		if(!res) return 0;
		return review.getRe_num();
	}

	@Override
	public boolean insertReviewFile(int re_num, MultipartFile[] uploadFile) {
		if(re_num<=0) return false;
		for(MultipartFile file : uploadFile) {
			if(file == null || file.getOriginalFilename().length() == 0)
				return true;
			try {
				String path = UploadFileUtils.uploadFile(uploadPath, 
						file.getOriginalFilename(), file.getBytes());
				FileVO fileVo = new FileVO(re_num, "review",file.getOriginalFilename(),path);
				reviewDao.insertFile(fileVo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return true;
	}

	@Override
	public ArrayList<ReviewVO> getReviewList(int pd_num, Criteria cri) {
		if(cri==null) cri= new Criteria();
		
		ArrayList<ReviewVO> review =reviewDao.selectReviewList(pd_num,cri);
		FileVO file = null;
		int reportCount = -1;
		for(int i=0; i<review.size(); i++) {
			file=reviewDao.getFileByReview(review.get(i).getRe_num(),"review");
			reportCount=reviewDao.getReportCount(review.get(i),"review");
			review.get(i).setRe_file(file);
			review.get(i).setReportCount(reportCount);
		}		
		
		return review;
	}

	@Override
	public int getTotalCountReviewList(int pd_num) {
		return reviewDao.selectTotalCountReviewList(pd_num);
	}

	@Override
	public boolean deleteReview(String me_id, ReviewVO review) {
		if(review==null) return false;
		if(me_id.trim().length()<0) return false;
		if(reviewDao.deleteReview(me_id,review.getRe_num())==0) return false;
		return true;
	}

	@Override
	public ArrayList<ReviewCommentVO> getRCommentList(int rc_re_num, Criteria cri) {
		if(cri==null) cri= new Criteria();
		if(rc_re_num<=0) return null;
		
		ArrayList<ReviewCommentVO> rComment =reviewDao.selectRCommentList(rc_re_num,cri);
		return rComment;
	}

	@Override
	public int getTotalCountReviewCommentList(int rc_re_num) {
		return reviewDao.selectTotalCountReviewCommentList(rc_re_num);
	}

	@Override
	public boolean insertReviewComment(ReviewCommentVO reviewComment, String me_id) {
		if(me_id==null) return false;
		if(reviewComment==null ||
			reviewComment.getRc_content().trim().length()<=0) return false;
		return reviewDao.insertReviewComment(reviewComment, me_id);
	}

	@Override
	public boolean deleteReviewComment(ReviewCommentVO reviewComment, String me_id) {
		if(reviewComment==null) return false;
		if(me_id==null) return false;
		return reviewDao.deleteReviewComment(me_id, reviewComment.getRc_num());
	}

	@Override
	public boolean reportReview(ReportVO report, MemberVO user) {
		if(user == null) return false;
		if(report==null ||
				report.getRep_category() ==null ||
				report.getRep_content().trim().length()<=0 ||
				report.getRep_table()==null ||
				report.getRep_table_key()<= 0) return false;
		return reviewDao.insertReportReview(report, user.getMe_id());
	}

	@Override
	public boolean reportComment(ReportVO report, MemberVO user) {
		if(user == null) return false;
		if(report==null ||
				report.getRep_category() ==null ||
				report.getRep_content().trim().length()<=0 ||
				report.getRep_table()==null ||
				report.getRep_table_key()<= 0) return false;
		return reviewDao.insertReportReview(report, user.getMe_id());
	}

	@Override
	public boolean insertReviewLike(LikeVO like) {
		if(like==null||
				like.getLi_me_id()==null||
				!like.getLi_table().contains("review")||
				like.getLi_table_key()<=0)return false;
		if(reviewDao.selectReview(like)!=null) return false;
		return reviewDao.insertReviewLike(like);
	}

	@Override
	public int getLikeCount(Integer re_num) {
		if(re_num<0) return 0;
		return reviewDao.getLikeCount(re_num,1,"review");
	}

	@Override
	public int getDislikeCount(Integer re_num) {
		if(re_num<0) return 0;
		return reviewDao.getLikeCount(re_num,-1,"review");
	}

	@Override
	public boolean updateReview(ReviewVO review) {
		if(review.getRe_me_id()==null) return false;
		if(review==null ||
			review.getRe_content().trim().length()<=0) return false;
		return reviewDao.updateReview(review);
	}

	@Override
	public boolean updateReviewFile(MultipartFile[] uploadFile, int table_key) {
		if(table_key<=0) return false;
		for(MultipartFile file : uploadFile) {
			if(file == null || file.getOriginalFilename().length() == 0)
				return true;
			try {
				
				String path = UploadFileUtils.uploadFile(uploadPath, 
						file.getOriginalFilename(), file.getBytes());
				FileVO fileVo = new FileVO(table_key, "review",file.getOriginalFilename(),path);
				if(reviewDao.getFileByReview(table_key, "review")==null) {
					reviewDao.insertFile(fileVo);
					return true;
				}
				return reviewDao.updateFile(fileVo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	@Override
	public int getLike(ReviewVO review) {
		if(review==null) return -2;
		if(review.getRe_content().trim().length()<=0 ||
				review.getRe_me_id()==null||
				review.getRe_num()<=0 ||
				review.getRe_pd_num()<=0||
				review.getRe_rating()<=0||
				review.getRe_date()==null) return -2;
		
	if(reviewDao.getReviewLike(review, "review") != null) return reviewDao.getReviewLike(review, "review").getLi_updown();
		return 0;
	}

	@Override
	public boolean deleteReviewLike(LikeVO like) {
		if(like.getLi_table()==null||
				like.getLi_table_key()<=0) return false;
		
		boolean res = reviewDao.deleteReviewLike(like);
		return	res;
	}

	@Override
	public boolean checkReportById(ReportVO report) {
		if(report==null||
				report.getRep_category()==null||
				report.getRep_content().trim().length()<=0||
				report.getRep_me_id()==null||
				report.getRep_table()==null||
				report.getRep_table_key()<=0) return false;
			
			
		int reportCount= reviewDao.checkReport(report);
		if(reportCount>0) return false;
		return true;
	}

	




	
}
