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
	public boolean insertReviewFile(int re_num, int re_pd_num, MultipartFile[] uploadFile) {
		if(re_num<=0 || re_pd_num<=0) return false;
		for(MultipartFile file : uploadFile) {
			if(file == null || file.getOriginalFilename().length() == 0)
				return true;
			try {
				String path = UploadFileUtils.uploadFile(uploadPath, 
						file.getOriginalFilename(), file.getBytes());
				FileVO fileVo = new FileVO("유저 리뷰이미지/"+re_pd_num+"/"+re_num,file.getOriginalFilename(),path, 
						re_pd_num);
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
		return reviewDao.selectReviewList(pd_num,cri);
	}

	@Override
	public int getTotalCountReviewList(int pd_num) {
		return reviewDao.selectTotalCountReviewList(pd_num);
	}
	




	
}
