package kr.dbp.naemom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.dbp.naemom.service.ProductOptionService;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;

@RestController
public class ProductOptionAjaxController {
	
	@Autowired
	ProductOptionService productOptionService;
	

	@RequestMapping(value="/delete/option/festival", method=RequestMethod.POST)
	public Map<String, Object> deleteFestival(@RequestBody Option_festivalVO festival){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res =productOptionService.deleteFestival(festival.getFo_num());
		map.put("res", res);
		return map;		
	}
	@RequestMapping(value="/insert/option/festival", method=RequestMethod.POST)
	public Map<String, Object> insertFestival(@RequestBody ArrayList<Option_festivalVO> festival){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = productOptionService.insertFestival(festival);
		map.put("res", res);
		return map;		
	}
	@RequestMapping(value="/update/option/festival", method=RequestMethod.POST)
	public Map<String, Object> updateFestival(@RequestBody Option_festivalVO festival){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = productOptionService.updateFestival(festival);
		map.put("res", res);
		return map;		
	}
	
	@RequestMapping(value="/delete/option/landmark", method=RequestMethod.POST)
	public Map<String, Object> deleteLandMark(@RequestBody Option_landMarkVO landmark){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res =productOptionService.deleteLandmark(landmark.getLo_num());
		map.put("res", res);
		return map;		
	}
	@RequestMapping(value="/insert/option/landmark", method=RequestMethod.POST)
	public Map<String, Object> insertLandMark(@RequestBody ArrayList<Option_landMarkVO> landmark){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = productOptionService.insertLandmark(landmark);
		map.put("res", res);
		return map;		
	}
	@RequestMapping(value="/update/option/landmark", method=RequestMethod.POST)
	public Map<String, Object> updateLandMark(@RequestBody Option_landMarkVO landmark){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = productOptionService.updateLandmark(landmark);
		map.put("res", res);
		return map;		
	}
}
