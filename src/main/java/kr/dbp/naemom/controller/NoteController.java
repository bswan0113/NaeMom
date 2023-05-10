package kr.dbp.naemom.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.service.NoteService;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.NoteVO;


@Controller
public class NoteController {
	
	@Autowired
	NoteService noteService;
	@RequestMapping(value = "/note/noteList")
	public ModelAndView opList(ModelAndView mv,HttpSession session,HttpServletResponse response) {
		MemberVO user =(MemberVO)session.getAttribute("user");
		if(user != null) {
			ArrayList<NoteVO> list = noteService.getNoteByUser(user.getMe_id());
			mv.addObject("note", list);
			System.out.println(list);
		}
		mv.setViewName("/note/noteList");
		return mv;
	}
}