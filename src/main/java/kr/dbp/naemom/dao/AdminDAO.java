package kr.dbp.naemom.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.qnaVO;

public interface AdminDAO {

	Integer getCountQList();

	ArrayList<qnaVO> getQList(@Param("cri")Criteria cri);



}
