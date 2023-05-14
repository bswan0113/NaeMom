package kr.dbp.naemom.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.GraphDAO;
import kr.dbp.naemom.vo.ChangeProductVO;
import kr.dbp.naemom.vo.ProductVO;
import kr.dbp.naemom.vo.SearchKeywordVO;
import kr.dbp.naemom.vo.VisitedVO;

@Service
public class GraphServiceImp implements GraphService{


	@Autowired
	GraphDAO graphDao;

	@Override
	public int getTotalSearchCount() {
		return graphDao.getTotalSearchCount();
	}

	@Override
	public ArrayList<SearchKeywordVO> getSearchKeyword(int count) {
		ArrayList<SearchKeywordVO> list = graphDao.getSearchKeyword(count);
		return list;
	}
	@Override
	public int getTotalSearchCountM() {
		return graphDao.getTotalSearchCountM();
	}

	@Override
	public ArrayList<SearchKeywordVO> getSearchKeywordM(int count) {
		ArrayList<SearchKeywordVO> list = graphDao.getSearchKeywordM(count);
		return list;
	}
	@Override
	public int getTotalSearchCountY() {
		return graphDao.getTotalSearchCountY();
	}

	@Override
	public ArrayList<SearchKeywordVO> getSearchKeywordY(int count) {
		ArrayList<SearchKeywordVO> list = graphDao.getSearchKeywordY(count);
		return list;
	}

	@Override
	public ArrayList<VisitedVO> getVisit(LocalDate day) {
		LocalDateTime start =day.atStartOfDay();
		LocalDateTime end = day.atTime(LocalTime.MAX);
		return graphDao.getVisit(start,end);
	}

	@Override
	public ArrayList<VisitedVO> getVisitM(LocalDate day) {
		LocalDateTime start =day.atStartOfDay();
		LocalDateTime end = day.atTime(LocalTime.MAX);
		return graphDao.getVisitM(start,end);
	}

	@Override
	public ArrayList<VisitedVO> getVisitMG(LocalDate Months) {
		LocalDate start = Months.withDayOfMonth(1);
		LocalDate end = Months.with(TemporalAdjusters.lastDayOfMonth());
		return graphDao.getVisitMG(start,end);
	}

	@Override
	public ArrayList<VisitedVO> getVisitMM(LocalDate Months) {
		LocalDate start = Months.withDayOfMonth(1);
		LocalDate end = Months.with(TemporalAdjusters.lastDayOfMonth());
		return graphDao.getVisitMM(start,end);
	}

	@Override
	public ArrayList<VisitedVO> getVisitYG(LocalDate years) {
		LocalDate start = years.withDayOfYear(1);
		LocalDate end = years.with(TemporalAdjusters.lastDayOfYear());
		return graphDao.getVisitYG(start,end);
	}

	@Override
	public ArrayList<VisitedVO> getVisitYM(LocalDate years) {
		LocalDate start = years.withDayOfYear(1);
		LocalDate end = years.with(TemporalAdjusters.lastDayOfYear());
		return graphDao.getVisitYM(start,end);
	}

	@Override
	public ArrayList<ProductVO> getProductRanking() {
		int count = 10;
		
		return graphDao.getProductRanking(count);
	}

	@Override
	public ArrayList<ChangeProductVO> getWeeklyPRanking() {
		int count = 10;
		return graphDao.getWeeklyPRanking(count);
	}

	@Override
	public ArrayList<ChangeProductVO> getMonthlyPRanking() {
		int count = 10;
		return graphDao.getMonthlyPRanking(count);
	}

	@Override
	public ArrayList<ChangeProductVO> getProductRankingByRated() {
		int count = 10;
		return graphDao.getProductRankingByRated(count);
	}

	@Override
	public ArrayList<ChangeProductVO> getProductRankingByRatedDaily() {
		int count = 10;
		return graphDao.getProductRankingByRatedDaily(count);
	}

	@Override
	public ArrayList<ChangeProductVO> getProductRankingByRatedMonthly() {
		int count = 10;
		return graphDao.getProductRankingByRatedMonthly(count);
	}





}
