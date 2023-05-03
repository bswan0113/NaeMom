package kr.dbp.naemom.controller;



import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.service.MapService;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.ProductVO;


@Controller
public class MapController {
	
	@Autowired
	MapService mapService;
	
	@RequestMapping(value = "/map" , method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv) {
		ArrayList<ProductVO> plist = mapService.getProductList();
		ArrayList<FileVO> flist = mapService.getFileList();
		ArrayList<FileVO> files = new ArrayList<FileVO>();
		for(int i = 0; i < plist.size() ; i++) {
			plist.get(i).setFile(mapService.getFiles(plist.get(i).getPd_num()));
		}
		mv.addObject("files", files);
		mv.addObject("plist", plist);
		mv.setViewName("map/main");
		return mv;
	}

	


}
