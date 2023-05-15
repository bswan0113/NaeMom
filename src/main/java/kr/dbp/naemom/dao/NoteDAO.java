package kr.dbp.naemom.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.vo.NoteVO;

public interface NoteDAO {

	ArrayList<NoteVO> getNoteByUser(@Param("id")String me_id, @Param("cri")Criteria cri);

	int getTotalCountNoteByUser(@Param("id")String me_id);

	ArrayList<NoteVO> getNoteBySend(@Param("id")String me_id, @Param("cri")Criteria cri);

	int getTotalCountNoteBySend(@Param("id")String me_id);

	void noteRead(@Param("nt_num")int num);

	int deleteNote(@Param("nt_num")int num);

	boolean sendNote(@Param("nt")NoteVO note);

	



}
