package kr.dbp.naemom.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.HomeDAO;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.ProductVO;

@Service
public class HomeServiceImp implements HomeService {

	@Autowired
	HomeDAO homeDao;

	@Override
	public ArrayList<ProductVO> getHomeContent() {
		return homeDao.selectBoardList();
	}


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

	// 체크된 DB 비우고 가져오기
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
	// 체크된 DB 비우고 가져오기 끝


	@Override
	public ArrayList<ProductVO> getCheckedList() {
		return homeDao.getCheckedList();
	}


	@Override
	public FileVO getFiles(int pd_num) {
		FileVO files= homeDao.getFile(pd_num,"product", "게시글 썸네일");
		System.out.println(files);
		return files;
	}
}
