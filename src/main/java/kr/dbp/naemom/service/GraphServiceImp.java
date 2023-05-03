package kr.dbp.naemom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.GraphDAO;

@Service
public class GraphServiceImp implements GraphService{


	@Autowired
	GraphDAO graphDao;

}
