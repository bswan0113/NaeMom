package kr.dbp.naemom.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.qnaVO;
import kr.dbp.naemom.vo.qna_AnswerVO;

public interface AdminDAO {

	Integer getCountQList();

	ArrayList<qnaVO> getQList(@Param("cri")Criteria cri);

	qnaVO getQnaByNum(@Param("qa_num")int qa_num);

	boolean insertAnswer(@Param("qaa")qna_AnswerVO answer);

	int updateQnaState(@Param("qaa_qa_num")int qaa_qa_num);



}
