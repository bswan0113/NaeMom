package kr.dbp.naemom.service;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.dao.HomeDAO;
import kr.dbp.naemom.utils.UploadFileUtils;
import kr.dbp.naemom.vo.CourseItemVO;
import kr.dbp.naemom.vo.CourseVO;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.ProductVO;

@Service
public class HomeServiceImp implements HomeService {
	
//	String uploadPath = "D:\\uploadfiles";
	String uploadPath = "/Users/hyunkyulee/final/Uploadfiles";

	@Autowired
	HomeDAO homeDao;
	

	@Override
	public ArrayList<ProductVO> getHomeContent() {
		return homeDao.selectBoardList();
	}

	// 메인컨텐츠 1
	
	// 컨텐츠 등록페이지
	@Override
	public ArrayList<ProductVO> searchProductByKeyword(String keyword) {
		if(keyword == null)
			keyword = "";
		return homeDao.selectProductByKeyword(keyword);
	}

	@Override
	public ArrayList<ProductVO> getProductList() {
		return homeDao.getProductList();
	}

	@Override
	public void insertProductChecked(int[] pdc_checked) {
		if(pdc_checked == null)
			return;
		homeDao.insertProductChecked(pdc_checked);
	}


	@Override
	public void deleteProductChecked(int[] pdc_checked) {
		homeDao.deleteProductChecked(pdc_checked);
		
	}


	@Override
	public ArrayList<ProductVO> getCheckedList() {
		return homeDao.getCheckedList();
	}


	@Override
	public FileVO getFiles(int pd_num) {
		FileVO files= homeDao.getFile(pd_num,"product", "게시글 썸네일");
		return files;
	}


	// 이벤트 이미지
	@Override
	public void addImage(MultipartFile files) {
		if(files==null) 
			return;
		String fileName="";
		try {
			System.out.println(files.getOriginalFilename());
			fileName=UploadFileUtils.uploadFile(uploadPath, files.getOriginalFilename(), files.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		FileVO fileVo = new FileVO("이벤트 이미지", files.getOriginalFilename(), fileName, 1);
		fileVo.setFi_table("Event");
		homeDao.addImage(fileVo);
	}

	@Override
	public ArrayList<FileVO> getFileList() {
		return homeDao.getFileList();
	}
	
	// 이미지 등록페이지에서 보여지는 이미지 가져오기
	@Override
	public ArrayList<FileVO> selectImage() {
		return homeDao.selectImage();
	}
	
	// 기존 이미지 지우기
	@Override
	public void deleteFileChecked(int[] fc_checked) {
		homeDao.deleteFileChecked(fc_checked);
		
	}

	@Override
	public void insertFileChecked(int[] fc_checked) {
		if(fc_checked == null)
			return;
		homeDao.insertFileChecked(fc_checked);
		
	}

	@Override
	public ProductVO getProductById(int pd_num) {
		return homeDao.getProductById(pd_num);
	}

	@Override
	public ArrayList<CourseVO> getCourseList() {
		return homeDao.selectCourseList();
	}

	@Override
	public ArrayList<CourseItemVO> getCourseItem(int co_num) {
		if(co_num == 0)
			return null;
		return homeDao.selectCourseItem(co_num);
	}
	
	@Override
	public ArrayList<FileVO> getProductImgList() {
		String fi_category = "게시글 썸네일";
		String fi_table = "product";
		return homeDao.selectProductImgList(fi_category, fi_table);
	}

	@Override
	public ArrayList<ProductVO> getFestivalList() {
		return homeDao.selectFestivalList();
	}

	@Override
	public ArrayList<FileVO> getFestivalImgList() {
		String fi_category = "게시글 썸네일";
		String fi_table = "product";
		return homeDao.selectProductImgList(fi_category, fi_table);
	}

	
	

	
}
