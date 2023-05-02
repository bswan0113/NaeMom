package kr.dbp.naemom.dao;

import java.time.LocalDate;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.vo.SearchKeywordVO;
import kr.dbp.naemom.vo.VisitedVO;

public interface GraphDAO {

	int getTotalSearchCount();

	ArrayList<SearchKeywordVO> getSearchKeyword(@Param("count")int count);

	int getTotalSearchCountM();

	ArrayList<SearchKeywordVO> getSearchKeywordM(@Param("count")int count);
	
	int getTotalSearchCountY();

	ArrayList<SearchKeywordVO> getSearchKeywordY(@Param("count")int count);



}
