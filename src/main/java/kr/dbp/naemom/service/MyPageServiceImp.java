package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.dao.MyPageDAO;
import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.utils.UploadFileUtils;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.Member_profileVO;
import kr.dbp.naemom.vo.Qna_Sub_categoryVO;
import kr.dbp.naemom.vo.qnaVO;
import kr.dbp.naemom.vo.qna_AnswerVO;

@Service
public class MyPageServiceImp implements MyPageService{

	@Autowired
	MyPageDAO myPageDao;
	
	String uploadPath = "C:\\uploadfiles";
	
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
		if(member.getMe_authority()<1 ||
				member.getMe_birthday()==null||
				member.getMe_nickname().trim().length()<=0||
				member.getMe_registered_address().trim().length()<=0||
				member.getMe_name().trim().length()<=0||
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
			
			
			System.out.println("오리  : "+oriProfile);
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
				qna.getQa_title().trim().length()<=0||
				qna.getQa_pd_num()<=0) return false;
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

}
