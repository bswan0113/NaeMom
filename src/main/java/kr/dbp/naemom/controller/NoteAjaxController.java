package kr.dbp.naemom.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.dbp.naemom.service.NoteService;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.NoteVO;


@RestController
public class NoteAjaxController {
	
	@Autowired
	NoteService noteService;
	
	@RequestMapping(value = "/note/isread/{num}", method=RequestMethod.GET)
	public void isRead(@PathVariable("num")int num) {
		noteService.noteRead(num);
		
	}
	@RequestMapping(value = "/note/delete/{num}", method=RequestMethod.GET)
	public boolean deleteNote(@PathVariable("num")int num) {
		
		return noteService.deleteNote(num);
	}
	
	@RequestMapping(value = "/note/send", method=RequestMethod.POST)
	public boolean sendNote(@RequestBody NoteVO note, HttpSession session) {
		MemberVO user =(MemberVO)session.getAttribute("user");
		if(user != null) {
			note.setNt_sender(user.getMe_id());
			return noteService.sendNote(note);
		}
		return false;
	}
}