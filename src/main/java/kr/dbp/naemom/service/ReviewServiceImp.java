package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.dao.ReviewDAO;
import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.utils.UploadFileUtils;
import kr.dbp.naemom.vo.FileVO;
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
		
		for(int i=0; i<review.size(); i++) {
			file=reviewDao.getFileByReview(review.get(i).getRe_num(),"review");
			review.get(i).setRe_file(file);
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

	




	
}
