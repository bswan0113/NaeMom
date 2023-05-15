package kr.dbp.naemom.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.pagination.PageMaker;
import kr.dbp.naemom.service.NoteService;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.NoteVO;


@Controller
public class NoteController {
	
	@Autowired
	NoteService noteService;
	@RequestMapping(value = "/note/noteList")
	public ModelAndView opList(ModelAndView mv,HttpSession session,HttpServletResponse response, Criteria cri, @RequestParam(value = "isRead", required = false)boolean isRead) {
		if(cri==null) cri=new Criteria();
		MemberVO user =(MemberVO)session.getAttribute("user");
		if(user != null) {
			if(isRead) {
				int totalCount = noteService.getTotalCountNoteBySend(user.getMe_id());
				PageMaker pm = new PageMaker(totalCount,5,cri);
				ArrayList<NoteVO> list = noteService.getNoteBySend(user.getMe_id(),cri);
				mv.addObject("pm", pm);
				mv.addObject("note", list);
				mv.addObject("isSend", true);
			}else {
			ArrayList<NoteVO> list = noteService.getNoteByUser(user.getMe_id(),cri);
			int totalCount = noteService.getTotalCountNoteByUser(user.getMe_id());
			PageMaker pm = new PageMaker(totalCount, 5, cri);
			mv.addObject("pm", pm);
			mv.addObject("note", list);
			mv.addObject("isSend", false);
			}
		}
		mv.setViewName("/note/noteList");
		return mv;
	}
}