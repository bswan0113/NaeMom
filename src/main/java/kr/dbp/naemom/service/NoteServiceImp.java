package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.NoteDAO;
import kr.dbp.naemom.vo.NoteVO;

@Service
public class NoteServiceImp implements NoteService{

	@Autowired
	NoteDAO noteDao;

	@Override
	public ArrayList<NoteVO> getNoteByUser(String me_id) {
		
		return noteDao.getNoteByUser(me_id);
	}
}
