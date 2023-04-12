package kr.dbp.naemom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.MyPageDAO;
import kr.dbp.naemom.vo.MemberVO;

@Service
public class MyPageServiceImp implements MyPageService{

@Autowired
MyPageDAO MyPageDao;

@Override
public MemberVO getUserInfo(MemberVO user) {
if(user==null||
			user.getMe_authority()<1||
			user.getMe_id()==null) return null;
	
	return MyPageDao.getUserInfo(user.getMe_id());
}

}
