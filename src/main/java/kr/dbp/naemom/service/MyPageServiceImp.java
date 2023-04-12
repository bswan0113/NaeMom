package kr.dbp.naemom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.MyPageDAO;

@Service
public class MyPageServiceImp implements MyPageService{

@Autowired
MyPageDAO MyPageDao;

}
