package kr.dbp.naemom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.service.ProductOptionService;
import kr.dbp.naemom.vo.Option_accomodationVO;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;
import kr.dbp.naemom.vo.Option_restrauntVO;

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
	
	
	@RequestMapping(value="/delete/option/restraunt", method=RequestMethod.POST)
	public Map<String, Object> deleteRestraunt(@RequestBody Option_restrauntVO restraunt){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = productOptionService.deleteRestraunt(restraunt.getReo_num());
		map.put("res", res);
		return map;		
	}

	@RequestMapping(value="/update/option/restraunt", method=RequestMethod.POST)
	public Map<String, Object> updateRestraunt(@RequestBody Option_restrauntVO restraunt){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = productOptionService.updateRestraunt(restraunt);
		map.put("res", res);

		return map;		
	}
	
	@RequestMapping(value="/update/option/restraunt/file/{reo_num}", method=RequestMethod.POST)
	public  Map<String, Object> updateRestrauntOptionFile(@RequestBody MultipartFile uploadFile, 
			@PathVariable("reo_num")int reo_num){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = productOptionService.updateRestrauntOptionFile(uploadFile,reo_num);
		map.put("res", res);
		
		return map;
	}
	
	
	@RequestMapping(value="/delete/option/accomodation", method=RequestMethod.POST)
	public Map<String, Object> deleteAccomodation(@RequestBody Option_accomodationVO accomodation){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = productOptionService.deleteAccomodation(accomodation.getAo_num());
		map.put("res", res);
		return map;		
	}

	@RequestMapping(value="/update/option/accomodation", method=RequestMethod.POST)
	public Map<String, Object> updateAccomodation(@RequestBody Option_accomodationVO accomodation){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = productOptionService.updateAccomodation(accomodation);
		map.put("res", res);

		return map;		
	}
	
	@RequestMapping(value="/update/option/accomodation/file/{ao_num}", method=RequestMethod.POST)
	public  Map<String, Object> updateAccomodationOptionFile(@RequestBody MultipartFile uploadFile, 
			@PathVariable("ao_num")int ao_num){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = productOptionService.updateAccomodationOptionFile(uploadFile,ao_num);
		map.put("res", res);
		
		return map;
	}

	
	
	@RequestMapping(value="/admin/dayoff/{pdNum}", method=RequestMethod.POST)
	public Map<String, Object> updateDayOff(@RequestBody String[] dayOff, @PathVariable("pdNum")int pdNum){
		Map<String, Object> map = new HashMap<String, Object>();
		productOptionService.updateDayOff(dayOff, pdNum);
		return map;		
	}
	@RequestMapping(value="/admin/dayoff/insert/{pdNum}", method=RequestMethod.POST)
	public Map<String, Object> insertDayOff(@RequestBody String[] dayOff, @PathVariable("pdNum")int pdNum){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res= productOptionService.insertDayOff(dayOff, pdNum);
		map.put("res", res);
		return map;		
	}
	

}
