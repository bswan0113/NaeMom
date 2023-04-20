package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.AdminDAO;
import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.qnaVO;
import kr.dbp.naemom.vo.qna_AnswerVO;

@Service
public class AdminServiceImp implements AdminService{

	@Autowired
	AdminDAO adminDao;

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
	
	
}
