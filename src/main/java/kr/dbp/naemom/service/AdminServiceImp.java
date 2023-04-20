package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.AdminDAO;
import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.qnaVO;

@Service
public class AdminServiceImp implements AdminService{

	@Autowired
	AdminDAO adminDao;

	@Override
	public Integer getCountQList() {
		return adminDao.getCountQList();
	}

	@Override
	public ArrayList<qnaVO> getQList(Criteria cri) {
		if(cri==null) cri = new Criteria();
		return adminDao.getQList(cri);
	}
	
	
}
