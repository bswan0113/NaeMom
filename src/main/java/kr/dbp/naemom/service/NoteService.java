package kr.dbp.naemom.service;

import java.util.ArrayList;

import kr.dbp.naemom.vo.NoteVO;

public interface NoteService {

	ArrayList<NoteVO> getNoteByUser(String me_id);


}
