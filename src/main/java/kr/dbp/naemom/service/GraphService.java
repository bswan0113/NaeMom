package kr.dbp.naemom.service;

import java.time.LocalDate;
import java.util.ArrayList;

import kr.dbp.naemom.vo.SearchKeywordVO;
import kr.dbp.naemom.vo.VisitedVO;

public interface GraphService {

	int getTotalSearchCount();

	ArrayList<SearchKeywordVO> getSearchKeyword(int count);

	int getTotalSearchCountM();

	ArrayList<SearchKeywordVO> getSearchKeywordM(int count);

	ArrayList<SearchKeywordVO> getSearchKeywordY(int count);

	int getTotalSearchCountY();

	ArrayList<VisitedVO> getVisit(LocalDate minusDays);

	

}
