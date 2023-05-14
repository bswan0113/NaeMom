package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.dao.MyPageDAO;
import kr.dbp.naemom.dao.ProductDAO;
import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.utils.UploadFileUtils;
import kr.dbp.naemom.vo.BuyListVO;
import kr.dbp.naemom.vo.Buy_listVO;
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

@Service
public class MyPageServiceImp implements MyPageService{

	@Autowired
	MyPageDAO myPageDao;
	
	@Autowired
	ProductDAO productDao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	String uploadPath = "D:\\uploadfiles";
	
	@Override
	public MemberVO getUserInfo(MemberVO user) {
	if(user==null||
				user.getMe_authority()<1||
				user.getMe_id()==null) return null;
		
		return myPageDao.getUserInfo(user.getMe_id());
	}
	
	@Override
	public boolean updateMember(MemberVO member) {
		if(member==null) return false;
		String pw = passwordEncoder.encode(member.getMe_pw());
		member.setMe_pw(pw);
		System.out.println(member);
		if(member.getMe_authority()<1 ||
				member.getMe_birthday()==null||
				member.getMe_nickname().trim().length()<=0||
				member.getMe_registered_address().trim().length()<=0||
				member.getMe_phone().trim().length()<=0||
				member.getMe_street_address().trim().length()<=0
				) return false;
		
		
			return myPageDao.updateMember(member)>=0;
	}

	@Override
	public boolean updateProfileImg(MultipartFile file, String me_id) {
		if(me_id==null || me_id.trim().length()<=0) return false;
		if(file==null|| file.getOriginalFilename().trim().length()<=0) return false;
		Member_profileVO upload = new Member_profileVO();
		String fileName ="";
		try {
			fileName=UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			upload.setMf_name(fileName);
			upload.setMf_ori_name(file.getOriginalFilename());
			Member_profileVO oriProfile = myPageDao.getProfileImg(me_id);
			
			
			if(oriProfile==null ||  oriProfile.getMf_ori_name()==null) {
				return myPageDao.insertProfileImg(upload, me_id);
			}else {
				upload.setMf_num(oriProfile.getMf_num());
				upload.setMf_me_id(me_id);
				
				return myPageDao.updateProfileImg(upload)>=0;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return true;
	}

	@Override
	public Member_profileVO getProfileImg(String me_id) {
		if(me_id==null || me_id.trim().length()<=0) return null;
		
		
		return myPageDao.getProfileImg(me_id);
	}

	@Override
	public ArrayList<qnaVO> getQnaCount(String me_id) {
		if(me_id==null || me_id.trim().length()<=0) return new ArrayList<qnaVO>();
		return myPageDao.getQnaCount(me_id);
	}

	@Override
	public ArrayList<qnaVO> getQnaList(String me_id, Criteria cri) {
		if(cri==null) cri=new Criteria();
		if(me_id==null || me_id.trim().length()<=0) return new ArrayList<qnaVO>();
		return myPageDao.getQnaList(me_id, cri);
	}

	@Override
	public ArrayList<Qna_Sub_categoryVO> getQnaCategory() {
		return myPageDao.getCategoryList();
	}

	@Override
	public boolean insertQna(qnaVO qna, MultipartFile[] files) {
		if(qna==null||
				qna.getQa_content().trim().length()<=0||
				qna.getQa_me_id().trim().length()<=0||
				qna.getQa_title().trim().length()<=0) return false;
		qna.setQa_state("0");
		boolean res=myPageDao.insertQna(qna);
		if(res)insertQnaFile(files, qna.getQa_num());
		return res;
 	}

	private void insertQnaFile(MultipartFile[] files,  int qa_num) {
		if(files==null) return;
		String fileName ="";
		try {
			for(MultipartFile file : files) {
				if(file.getOriginalFilename().isEmpty()) {
		            continue;
		        }
				fileName=UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
				FileVO uploadFile = new FileVO();
				uploadFile.setFi_table("qna");
				uploadFile.setFi_name(fileName);
				uploadFile.setFi_ori_name(file.getOriginalFilename());
				uploadFile.setFi_table_key(qa_num);
				myPageDao.insertFile(uploadFile);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public qnaVO getQna(int qa_num) {
		
		return myPageDao.getQna(qa_num);
	}

	@Override
	public qna_AnswerVO getAnswer(int qa_num) {
		qna_AnswerVO answer = myPageDao.getAnswer(qa_num);
		if(answer == null)answer= new qna_AnswerVO();
		return answer;
	}

	@Override
	public boolean deleteQna(int qa_num) {
		if(qa_num<=0) return false;
		return myPageDao.deleteQna(qa_num) != 0;
	}

	@Override
	public ArrayList<ReviewVO> getReviewList(Criteria cri, String me_id) {
		if(cri==null) cri= new Criteria();
		
		return myPageDao.getReviewList(cri, me_id);
	}

	@Override
	public int getReviewCount(String me_id) {
		return myPageDao.getReviewCount(me_id);
	}

	@Override
	public String getPdTitle(int re_pd_num) {
		if(re_pd_num<=0) return "";
		return myPageDao.getPdTitleByRePdNum(re_pd_num);
	}

	@Override
	public ArrayList<WishVO> getWishList(String me_id, Criteria cri) {
		return myPageDao.getWishList(me_id, cri);
	}

	@Override
	public int getWishCount(String me_id) {
		return myPageDao.getWishCount(me_id);
	}

	@Override
	public ProductVO getProductByPdNum(int wi_pd_num) {
		ProductVO product = productDao.selectProductByNum(wi_pd_num);
		if(product == null) return new ProductVO();
		return product;
	}

	@Override
	public FileVO getFileByPdNum(int wi_pd_num) {
		FileVO file = productDao.getThumbNail(wi_pd_num, "썸네일", "product");
		if(file==null) return new FileVO();
		return file;
	}

	@Override
	public ArrayList<MileageVO> getMilageList(String me_id, Criteria cri) {
		return myPageDao.getMileageList(me_id, cri);
	}

	@Override
	public int getMileageCount(String me_id) {
		return myPageDao.getMileageCount(me_id);
	}

	@Override
	public Integer getexpirationMileage(String me_id) {
		return myPageDao.getexpirationMileage(me_id);
	}


	@Override
	public ArrayList<Buy_listVO> getBuyList(String me_id, Criteria cri) {
		if(me_id == null)
			return null;
		return myPageDao.getBuyList(me_id, cri);
	}

	@Override
	public int getBuyListCount(String me_id) {
		return myPageDao.getBuyListCount(me_id);
	}

	@Override
	public ArrayList<CourseVO> getCourseList(Criteria cri, String me_id) {
		if(cri==null) cri = new Criteria();
		return myPageDao.getCourseList(cri, me_id);
	}

	@Override
	public CourseItemVO getCourseItem(int co_num) {
		ArrayList<CourseItemVO> course = myPageDao.getCourseItem(co_num);
		if(course != null && course.size()>= 0) {
			course.get(0).setFile(productDao.getThumbNail(course.get(0).getCi_pd_num(), "썸네일", "product"));
		}
		return course.get(0);
	}

	@Override
	public boolean changeEmail(String email, String userId) {
		return myPageDao.changeEmail(email,userId)>=0;
	}

	@Override
	public int updateBuyList(String bl_num, String me_id) {
		if(bl_num == null || me_id == null)
			return 0;
		String state = "결제취소요청";
		return myPageDao.updateBuyCancel(bl_num, me_id, state);
  }

  @Override
	public ArrayList<ProductVO> getRecPr(MemberVO user, int count) {
		int fe = user.getMe_score_fe();
		int ao = user.getMe_score_ao();
		int reo = user.getMe_score_reo();
		int la = user.getMe_score_la();
	    
	    int maxScore = user.getMe_score_fe(); // 첫 번째 값을 최대값으로 설정
	    int table = 4; // 기본값으로 테이블명을 설정해놓습니다.

	    if (ao > maxScore) {
	        maxScore = ao;
	        table = 3; // ao가 최대값일 때 테이블명을 설정합니다.
	    }
	    if (reo > maxScore) {
	        maxScore = reo;
	        table = 2; // reo가 최대값일 때 테이블명을 설정합니다.
	    }
	    if (la > maxScore) {
	        maxScore = la;
	        table = 1; // la가 최대값일 때 테이블명을 설정합니다.
	    }
	    ArrayList<ProductVO> product= myPageDao.getProductByuserPrefer(table, count);
		return product;
	}

@Override
public int getCourseListCount(String me_id) {
	
	return myPageDao.selectCourseListCount(me_id);
}
@Override
public int getUnreadMailCount(String me_id) {
	return myPageDao.getUnreadMailCount(me_id);

}

}
