package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.AdminDAO;
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

@Service
public class AdminServiceImp implements AdminService{

	@Autowired
	AdminDAO adminDao;
	
	@Autowired
	BCryptPasswordEncoder encoder;
	

	@Override
	public Integer getCountQList() {
		return adminDao.getCountQList();
	}

	@Override
	public ArrayList<qnaVO> getQList(Criteria cri) {
		if(cri==null) cri = new Criteria();
		return adminDao.getQList(cri);
	}

	@Override
	public qnaVO getQnaByNum(int qa_num) {
		if(qa_num<=0)return new qnaVO();
		return adminDao.getQnaByNum(qa_num);
	}

	@Override
	public boolean insertAnswer(qna_AnswerVO answer) {
		if(answer==null) return false;
		if(answer.getQaa_content().trim().length()<=0||
				answer.getQaa_qa_num()<=0)return false;
		if(adminDao.updateQnaState(answer.getQaa_qa_num())<0) return false;
		return 	adminDao.insertAnswer(answer);
	}

	@Override
	public int getUserCount() {
		return adminDao.getuserCount();
	}

	@Override
	public ArrayList<MemberVO> getUserList(Criteria cri) {
		if(cri==null) cri = new Criteria();
		
		return adminDao.getUserList(cri);
	}

	@Override
	public MemberVO getUserInfo(String me_id) {
		if(me_id==null) return new MemberVO();
		return adminDao.getUserInfo(me_id);
	}

	@Override
	public boolean resetPw(String id) {
		if(id==null || id.trim().length()<=0) return false;
		String reset = encoder.encode("abcd");
		return adminDao.resetPw(id, reset) >= 0;
	}

	@Override
	public boolean preventUser(MemberVO user) {
		if(user == null || user.getMe_id().trim().length()<=0) return false;
		return adminDao.preventUser(user)>0;
	}

	@Override
	public ArrayList<ReportManageVO> getReportList(String id, Criteria cri) {
		if(id==null||id.trim().length()<=0) return null;
		return adminDao.getReportList(id, cri);
	}

	@Override
	public ArrayList<Buy_listVO> getBuyList(String id, Criteria cri) {
		if(id==null||id.trim().length()<=0) return new ArrayList<Buy_listVO>();
		return adminDao.getBuyList(id, cri);
	}

	@Override
	public int getReportCount(String id) {
		if(id==null||id.trim().length()<=0) return 0;
		return adminDao.getReportCount(id);
	}

	@Override
	public int getPaymentCount(String id) {
		if(id==null||id.trim().length()<=0) return 0;
		return adminDao.getPaymentCount(id);
	}

	@Override
	public int getReCount(String id) {
		if(id==null||id.trim().length()<=0) return 0;
		return adminDao.getReCount(id);
	}

	@Override
	public ArrayList<ReviewVO> getReList(String id, Criteria cri) {
		if(id==null||id.trim().length()<=0) return null;
		return adminDao.getReList(id, cri);
	}

	@Override
	public int getRcCount(String id) {
		if(id==null||id.trim().length()<=0) return 0;
		return adminDao.getRcCount(id);
	}

	@Override
	public ArrayList<ReviewCommentVO> getRcList(String id, Criteria cri) {
		if(id==null||id.trim().length()<=0) return null;
		return adminDao.getRcList(id,cri);
	}

	@Override
	public int getCoCount(String id) {
		if(id==null||id.trim().length()<=0) return 0;
		return adminDao.getCoCount(id);
	}

	@Override
	public ArrayList<CourseVO> getCoList(String id, Criteria cri) {
		if(id==null||id.trim().length()<=0) return null;
		return adminDao.getCoList(id,cri);
	}

	@Override
	public ArrayList<CourseVO> getReportedCo() {
		return adminDao.getReportedCo();
	}

	@Override
	public ArrayList<ReviewVO> getReportedRe() {
		return adminDao.getReportedRe();
	}

	@Override
	public ArrayList<ReviewCommentVO> getReportedRc() {
		return adminDao.getReportedRc();
	}

	@Override
	public boolean deleteReview(int num) {
		return adminDao.deleteReview(num) != 0;
	}

	@Override
	public boolean deleteCourse(int num) {
		return adminDao.deleteCourse(num) != 0;
	}

	@Override
	public boolean deleteComment(int num) {
		return adminDao.deleteComment(num) != 0;
	}

	@Override
	public ArrayList<ReportVO> getReportByType(int num, String type) {
		if(num<=0) return null;
		if(type==null || type.trim().length()<=0)return null;
		return adminDao.getReportByType(num, type);
	}

	@Override
	public ArrayList<Hash_tagVO> getHashList(int pd_num) {
		return adminDao.getHashtag(pd_num);
	}

	@Override
	public boolean deleteHashtag(int parseInt) {
		return adminDao.deletehashTag(parseInt) != 0;
	}

	@Override
	public boolean insertHashtag(int pd_num, String[] list) {
		if(pd_num<1) return false;
		if(list ==null || list.length<1) return false;
		
		for(String hash : list) {
			if(!adminDao.insertHashtag(pd_num,hash))return false;
		}
		return true;
	}

	@Override
	public ArrayList<Buy_listVO> getAllBuyList(Criteria cri) {
		//String state = "결제완료";
		return adminDao.selectAllBuyList(cri);
	}

	@Override
	public int getBuyListCount() {
		//String state = "결제완료";
		return adminDao.selectCountBuyList();
	}
	@Override
	public ArrayList<Buy_listVO> getAllBuyListByState(Criteria cri,String state) {
		return adminDao.selectAllBuyListBystate(cri,state);
	}

	@Override
	public int getBuyListCountByState(String state) {
		return adminDao.selectCountBuyListBystate(state);
	}

	@Override
	public Buy_listVO getBuyListByNum(String bl_num) {
		
		return adminDao.selectBuyListByNum(bl_num);
	}

	@Override
	public void updateBuyList(String bl_num) {
		//buy_list 수정
		String state = "결제취소";
		adminDao.updateBuyList(bl_num,state);
		//order_list 삭제
		adminDao.deleteOrderList(bl_num);
		//옵션삭제
		adminDao.deleteRoomOption(bl_num);
		adminDao.deleteFoodOption(bl_num);
		//적립마일리지 삭제
		MileageVO mi = adminDao.selectMileage(bl_num);
		adminDao.updateMember(mi);
		adminDao.deleteMileage(bl_num);
  }	
  
  @Override
	public void addVisit(String id) {
		adminDao.addVisit(id);
		
	}

	//수정할 수도 안할 수도
	@Override
	public void updateVisit(String id) {
		if(id==null || id.trim().length()<=0) return;
		VisitedVO visit = adminDao.getVisit(id);
		if(visit ==null)return;
		adminDao.updateVisit(visit.getVi_num());
		
		
	}

	@Override
	public boolean getVisit(String id) {
		if(id==null || id.trim().length()<=0) return false;
		VisitedVO visit = adminDao.getVisit(id);		
		return visit == null;

	}

	@Override
	public String getAttendance(String me_id) {
		return adminDao.getAttendance(me_id);
	}

	@Override
	public void insertAttendance(String me_id) {
		adminDao.insetAttendance(me_id);
	}

	@Override
	public boolean insertAtMile(String me_id) {
		return adminDao.insertAtMile(me_id);
	}
	
	
}
