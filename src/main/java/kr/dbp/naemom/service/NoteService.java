package kr.dbp.naemom.service;

import java.util.ArrayList;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.NoteVO;

public interface NoteService {

	ArrayList<NoteVO> getNoteByUser(String me_id, Criteria cri);

	void noteRead(int num);

	int getTotalCountNoteByUser(String me_id);

	boolean deleteNote(int num);

	boolean sendNote(NoteVO note);

	int getTotalCountNoteBySend(String me_id);

	ArrayList<NoteVO> getNoteBySend(String me_id, Criteria cri);


}
