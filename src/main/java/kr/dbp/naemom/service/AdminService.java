package kr.dbp.naemom.service;

import java.util.ArrayList;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.qnaVO;

public interface AdminService {

	Integer getCountQList();

	ArrayList<qnaVO> getQList(Criteria cri);


}
