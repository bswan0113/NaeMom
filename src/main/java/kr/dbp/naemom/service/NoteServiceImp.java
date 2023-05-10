package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.MemberDAO;
import kr.dbp.naemom.dao.NoteDAO;
import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.NoteVO;

@Service
public class NoteServiceImp implements NoteService{

	@Autowired
	NoteDAO noteDao;
	
	@Autowired
	MemberDAO memberDao;

	@Override
	public ArrayList<NoteVO> getNoteByUser(String me_id, Criteria cri) {
		
		return noteDao.getNoteByUser(me_id, cri);
	}

	@Override
	public void noteRead(int num) {
		noteDao.noteRead(num);
		
	}

	@Override
	public int getTotalCountNoteByUser(String me_id) {
		return noteDao.getTotalCountNoteByUser(me_id);
	}

	@Override
	public boolean deleteNote(int num) {
		return noteDao.deleteNote(num) !=0;
	}

	@Override
	public boolean sendNote(NoteVO note) {
		if(memberDao.selectMemberById(note.getNt_receiver())==null)return false;
		return noteDao.sendNote(note);
	}

	@Override
	public int getTotalCountNoteBySend(String me_id) {
		// TODO Auto-generated method stub
		return noteDao.getTotalCountNoteBySend(me_id);
	}

	@Override
	public ArrayList<NoteVO> getNoteBySend(String me_id, Criteria cri) {
		// TODO Auto-generated method stub
		return noteDao.getNoteBySend(me_id, cri);
	}
}
