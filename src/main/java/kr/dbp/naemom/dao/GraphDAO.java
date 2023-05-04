package kr.dbp.naemom.dao;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.vo.ChangeProductVO;
import kr.dbp.naemom.vo.ProductVO;
import kr.dbp.naemom.vo.SearchKeywordVO;
import kr.dbp.naemom.vo.VisitedVO;

public interface GraphDAO {

	int getTotalSearchCount();

	ArrayList<SearchKeywordVO> getSearchKeyword(@Param("count")int count);

	int getTotalSearchCountM();

	ArrayList<SearchKeywordVO> getSearchKeywordM(@Param("count")int count);
	
	int getTotalSearchCountY();

	ArrayList<SearchKeywordVO> getSearchKeywordY(@Param("count")int count);

	ArrayList<VisitedVO> getVisit(@Param("start")LocalDateTime start, @Param("end")LocalDateTime end);

	ArrayList<VisitedVO> getVisitM(@Param("start")LocalDateTime start, @Param("end")LocalDateTime end);

	ArrayList<VisitedVO> getVisitMG(@Param("start")LocalDate start, @Param("end")LocalDate end);

	ArrayList<VisitedVO> getVisitMM(@Param("start")LocalDate start, @Param("end")LocalDate end);

	ArrayList<VisitedVO> getVisitYG(@Param("start")LocalDate start, @Param("end")LocalDate end);

	ArrayList<VisitedVO> getVisitYM(@Param("start")LocalDate start, @Param("end")LocalDate end);

	ArrayList<ProductVO> getProductRanking(@Param("limit")int i);

	ArrayList<ChangeProductVO> getWeeklyPRanking(@Param("limit")int count);

	ArrayList<ChangeProductVO> getMonthlyPRanking(@Param("limit")int count);

	ArrayList<ChangeProductVO> getProductRankingByRated(@Param("limit")int count);

	ArrayList<ChangeProductVO> getProductRankingByRatedDaily(@Param("limit")int count);

	ArrayList<ChangeProductVO> getProductRankingByRatedMonthly(@Param("limit")int count);





}
