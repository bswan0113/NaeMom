package kr.dbp.naemom.service;

import java.time.LocalDate;
import java.util.ArrayList;

import kr.dbp.naemom.vo.ChangeProductVO;
import kr.dbp.naemom.vo.ProductVO;
import kr.dbp.naemom.vo.SearchKeywordVO;
import kr.dbp.naemom.vo.VisitedVO;

public interface GraphService {

	int getTotalSearchCount();

	ArrayList<SearchKeywordVO> getSearchKeyword(int count);

	int getTotalSearchCountM();

	ArrayList<SearchKeywordVO> getSearchKeywordM(int count);

	ArrayList<SearchKeywordVO> getSearchKeywordY(int count);

	int getTotalSearchCountY();

	ArrayList<VisitedVO> getVisit(LocalDate localDateTime);

	ArrayList<VisitedVO> getVisitM(LocalDate localDateTime);

	ArrayList<VisitedVO> getVisitMG(LocalDate minusMonths);

	ArrayList<VisitedVO> getVisitMM(LocalDate minusMonths);

	ArrayList<VisitedVO> getVisitYG(LocalDate minusYears);

	ArrayList<VisitedVO> getVisitYM(LocalDate minusYears);

	ArrayList<ProductVO> getProductRanking();

	ArrayList<ChangeProductVO> getWeeklyPRanking();

	ArrayList<ChangeProductVO> getMonthlyPRanking();

	ArrayList<ChangeProductVO> getProductRankingByRated();

	ArrayList<ChangeProductVO> getProductRankingByRatedDaily();

	ArrayList<ChangeProductVO> getProductRankingByRatedMonthly();

	

}
