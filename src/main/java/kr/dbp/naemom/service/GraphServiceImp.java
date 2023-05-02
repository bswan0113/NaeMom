package kr.dbp.naemom.service;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.GraphDAO;
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
		
		return null;
	}





}
