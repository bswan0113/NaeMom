package kr.dbp.naemom.controller;



import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpEntity;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.dbp.naemom.service.HomeService;
import kr.dbp.naemom.utils.ApiKey;
import kr.dbp.naemom.vo.CourseItemVO;
import kr.dbp.naemom.vo.CourseVO;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.ProductVO;


@Controller
public class HomeController {
	
	@Autowired
	HomeService homeService;
	
	
	@RequestMapping(value = "/")
	public ModelAndView home(ModelAndView mv,HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		MemberVO user =(MemberVO)session.getAttribute("user");
		ArrayList<ProductVO> plist = homeService.getCheckedList();
		ArrayList<FileVO> flist = homeService.getFileList();
		ArrayList<FileVO> files = new ArrayList<FileVO>();
		List<ProductVO> recentProducts = new ArrayList<ProductVO>();
		ArrayList<CourseVO> clist = homeService.getCourseList();
		ArrayList<CourseItemVO> items = new ArrayList<CourseItemVO>();
		for(int i = 0; i < plist.size() ; i++) {
			plist.get(i).setFile(homeService.getFiles(plist.get(i).getPd_num()));
		}
		//최근 본 상품
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("recentProducts")) {
					String[] values = cookie.getValue().split("_");
					
					for (String value : values) {
						if(value.length()==0)
							continue;
						ProductVO product = homeService.getProductById(Integer.parseInt(value));
						recentProducts.add(product);
					}
				}
			}
		}
		//코스 
		Collections.shuffle(clist);
		int courseCount = Math.min(3, clist.size());
		List<CourseVO> randomClist = clist.subList(0, courseCount);

		for(int i=0; i<Math.min(clist.size(),3); i++) {
		    items.addAll(homeService.getCourseItem(randomClist.get(i).getCo_num()));
		}
		ArrayList<FileVO> courseFiles = homeService.getProductImgList();;
		
		//축제 
		ArrayList<ProductVO> festivalList = homeService.getFestivalList();
		ArrayList<FileVO> festivalFiles = homeService.getFestivalImgList();
		mv.addObject("user",user);
		mv.addObject("files", files);
		mv.addObject("flist",flist);
		mv.addObject("plist", plist);
		mv.addObject("recentProducts", recentProducts);
		mv.addObject("clist",clist);
		mv.addObject("items", items);
		mv.addObject("courseFiles", courseFiles);
		mv.addObject("festivalList", festivalList);
		mv.addObject("festivalFiles", festivalFiles);
		mv.setViewName("/main/home");
		return mv;
	}

	// 콘텐츠 등록 페이지 1
	@RequestMapping(value = "/main/insert", method = RequestMethod.GET)
	public ModelAndView homeContentsearch(ModelAndView mv, String keyword) {
	    ArrayList<ProductVO> plist = homeService.searchProductByKeyword(keyword);
	    mv.addObject("plist", plist);
	    mv.setViewName("/main/insert");
	    return mv;
	}
	
	// 체크된 상품 DB 추가
	@RequestMapping(value = "/main/insert/checked", method = RequestMethod.POST)
    public ModelAndView insertProductChecked(ModelAndView mv, ProductVO product, int[] pdc_checked) throws Exception {
		homeService.deleteProductChecked(pdc_checked);
		homeService.insertProductChecked(pdc_checked);
		ArrayList<ProductVO> plist = homeService.getCheckedList();
		mv.addObject("plist", plist);
		// if문으로 
		mv.setViewName("redirect:/");
        return mv;
    }
	
	//이벤트 등록 페이지
	@RequestMapping(value = "/main/addimage", method = RequestMethod.GET)
	public ModelAndView addImage(ModelAndView mv) {
		ArrayList<FileVO> flist = homeService.selectImage();
//		ArrayList<FileVO> fileUploadlist = homeService.selectUploadImage();
		mv.addObject("flist", flist);
		mv.setViewName("/main/addimage");
		return mv;
	}
	
	//이벤트 등록 페이지 이미지 추가
	@RequestMapping(value = "/main/addimage", method = RequestMethod.POST)
	public ModelAndView addImage(ModelAndView mv, MultipartFile files) {
		homeService.addImage(files);
		mv.addObject("files", files);
		mv.setViewName("redirect:/main/addimage/");
		return mv;
	}
	
	//이벤트 등록 페이지 이미지 보내기
	@RequestMapping(value = "/main/addimage/uploadimage", method = RequestMethod.POST)
	public ModelAndView uploadImage(ModelAndView mv,FileVO file,int[] imgCheckbox) {
		homeService.deleteFileChecked(imgCheckbox);
		homeService.insertFileChecked(imgCheckbox);			
		ArrayList<FileVO> flist = homeService.selectImage();
		mv.addObject("flist", flist);
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@RequestMapping(value = "/gpt/ask", method = RequestMethod.POST)
	@ResponseBody
	public String askGpt(@RequestParam("ask") String ask) {
	    String apiKey = new ApiKey().getGpt();
	    String result ="";
	 
	            try {
	                HttpClient httpClient = HttpClients.createDefault();
	                HttpPost request = new HttpPost("https://api.openai.com/v1/completions");
	                request.setHeader(HttpHeaders.AUTHORIZATION, "Bearer " + apiKey);
	                request.setHeader(HttpHeaders.CONTENT_TYPE, "application/json");

	                String requestBody = "{\"prompt\": \"" + ask + "\", \"max_tokens\": 50, \"model\": \"text-davinci-003\"}";
	                request.setEntity(new StringEntity(requestBody, "UTF-8"));

	                HttpResponse response = httpClient.execute(request);
	                HttpEntity responseEntity = response.getEntity();


	                String jsonResponse= EntityUtils.toString(responseEntity, "UTF-8");
	                JsonObject jsonObject = JsonParser.parseString(jsonResponse).getAsJsonObject();
	                JsonArray choicesArray = jsonObject.get("choices").getAsJsonArray();
	                JsonObject firstChoiceObject = choicesArray.get(0).getAsJsonObject();
	                result += firstChoiceObject.get("text").getAsString();
	                System.out.println(result);
	                return result;
	            } catch (IOException e) {
	                e.printStackTrace();
	                return null;
	    }
	}
	
	
	@RequestMapping(value = "/fill-roulette", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<ProductVO> fillRoulette() {
		ArrayList<ProductVO> list = homeService.getProductListByScore();
		return list;
	}



}
