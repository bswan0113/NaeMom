package kr.dbp.naemom.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.dbp.naemom.vo.NoteVO;

public interface NoteDAO {

	ArrayList<NoteVO> getNoteByUser(@Param("id")String me_id);

	



}
