package kr.dbp.naemom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.dbp.naemom.service.SearchService;
import kr.dbp.naemom.vo.CalendarVO;
import kr.dbp.naemom.vo.ProductVO;


@RestController
public class SearchAjaxController {
	
	@Autowired
	SearchService searchService;
	
	@RequestMapping(value = "/getDateInfoOfThisMonth", method = RequestMethod.POST)
	public Map<String, Object> getCal(CalendarVO date){
		Map<String, Object> map = new HashMap<String, Object>();
		CalendarVO day = new CalendarVO(date.getYear(),date.getMonth());
		map.put("cal", day);
		return map;
	}
	
	@RequestMapping(value = "/getFeInfo", method = RequestMethod.POST)
	public Map<String, Object> getFeInfo(CalendarVO date){
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<ProductVO> FeList = searchService.getFeList(date);
		map.put("FeList", FeList);
		return map;
	}
	
}