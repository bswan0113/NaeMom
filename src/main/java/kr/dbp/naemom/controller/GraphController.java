package kr.dbp.naemom.controller;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.service.GraphService;
import kr.dbp.naemom.vo.SearchKeywordVO;
import kr.dbp.naemom.vo.VisitedVO;

@Controller
public class GraphController {


	@Autowired
	GraphService graphService;
	
	@RequestMapping(value="/admin/home/main")
	public ModelAndView adminMain(ModelAndView mv) {
		ArrayList<SearchKeywordVO> keyword = getKeyWordList(10);
		ArrayList<SearchKeywordVO> keywordM = getKeyWordListM(10);
		ArrayList<SearchKeywordVO> keywordY = getKeyWordListY(10);
		ArrayList<VisitedVO> visit = graphService.getVisit(LocalDate.now().minusDays(1));
		
		mv.addObject("keywordY", keywordY);
		mv.addObject("keywordM", keywordM);
		mv.addObject("keyword", keyword);
		mv.setViewName("/admin/home/main");
		return mv;
	}


	private ArrayList<SearchKeywordVO> getKeyWordListY(int count) {	
		ArrayList<SearchKeywordVO> list = new ArrayList<SearchKeywordVO>();
		int totalSearchCount = graphService.getTotalSearchCountY();
		list = graphService.getSearchKeywordY(count);
		for(int i=0; i<list.size(); i++) {    
		double percentage = ((double)list.get(i).getCount()/totalSearchCount)*100;
	    double roundedPercentage = Math.ceil(percentage * 100) / 100.0;
	    list.get(i).setPer(roundedPercentage);
		}
		return list;
	}

	private ArrayList<SearchKeywordVO> getKeyWordListM(int count) {	
		ArrayList<SearchKeywordVO> list = new ArrayList<SearchKeywordVO>();
		int totalSearchCount = graphService.getTotalSearchCountM();
		list = graphService.getSearchKeywordM(count);
		for(int i=0; i<list.size(); i++) {    
		double percentage = ((double)list.get(i).getCount()/totalSearchCount)*100;
	    double roundedPercentage = Math.ceil(percentage * 100) / 100.0;
	    list.get(i).setPer(roundedPercentage);
		}
		return list;
	}

	private ArrayList<SearchKeywordVO> getKeyWordList(int count) {
		ArrayList<SearchKeywordVO> list = new ArrayList<SearchKeywordVO>();
		int totalSearchCount = graphService.getTotalSearchCount();
		list = graphService.getSearchKeyword(count);
		for(int i=0; i<list.size(); i++) {    
		double percentage = ((double)list.get(i).getCount()/totalSearchCount)*100;
	    double roundedPercentage = Math.ceil(percentage * 100) / 100.0;
	    list.get(i).setPer(roundedPercentage);
		}
		return list;
	}
}
