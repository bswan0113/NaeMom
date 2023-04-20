package kr.dbp.naemom.service;

import java.util.ArrayList;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.qnaVO;
import kr.dbp.naemom.vo.qna_AnswerVO;

public interface AdminService {

	Integer getCountQList();

	ArrayList<qnaVO> getQList(Criteria cri);

	qnaVO getQnaByNum(int qa_num);

	boolean insertAnswer(qna_AnswerVO answer);


}
