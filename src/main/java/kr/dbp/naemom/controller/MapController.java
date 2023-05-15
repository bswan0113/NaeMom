package kr.dbp.naemom.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.dbp.naemom.service.MapService;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.ProductCategoryVO;
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
		ArrayList<ProductCategoryVO> clist = mapService.getProductCategory();

		
		for (int i = 0; i < flist.size(); i++) {
		    if (flist.get(i).getFi_category().equals("게시글 썸네일")) {
		        files.add(flist.get(i));
		    }
		}
		
		mv.addObject("clist",clist);
		mv.addObject("flist",flist);
		mv.addObject("files", files);
		mv.addObject("plist", plist);
		mv.setViewName("map/main");
		return mv;
	}
	
	@RequestMapping(value = "/map/getProduct", method = RequestMethod.POST)
	public ModelAndView getProduct(@RequestParam("pd_pc_num") int pd_pc_num, ModelAndView mv) {
	    ArrayList<ProductVO> plist = mapService.getProductListByCategory(pd_pc_num);
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
	
	@ResponseBody
	@RequestMapping(value = "/map/searchProduct", method=RequestMethod.POST)
	public Map<String, Object> mapSearchProduct(@RequestBody ProductVO product,HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<ProductVO> products = mapService.getSearchProduct(product);
		ArrayList<ProductCategoryVO> pdCategory = mapService.getProductCategory();
		map.put("products", products);
		map.put("pdCategory", pdCategory);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/map/selectProduct", method=RequestMethod.POST)
	public Map<String, Object> mapSelectProduct(@RequestBody int pd_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<ProductVO> plist = mapService.getSelectProduct(pd_num);
		ArrayList<ProductCategoryVO> clist = mapService.getProductCategory();
		FileVO file = mapService.getProductImg(pd_num);
		map.put("clist", clist);
		map.put("file", file);
		map.put("plist", plist);
		return map;
	}

}
