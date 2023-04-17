package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.SearchDAO;
import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.ProductVO;

@Service
public class SearchServiceImp implements SearchService{


	@Autowired
	SearchDAO searchDao;
	@Override
	public ArrayList<ProductVO> getProduct(Criteria cri, int pd_pc_num) {
		return searchDao.getProduct(cri,pd_pc_num);
	}
	




}
