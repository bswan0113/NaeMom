package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dbp.naemom.dao.MapDAO;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.ProductVO;

@Service
public class MapServiceImp implements MapService {
	
	@Autowired
	MapDAO mapDao;

	@Override
	public ArrayList<ProductVO> getProductList() {
		return mapDao.selectGetProductList();
	}

	@Override
	public ArrayList<FileVO> getFileList() {
		return mapDao.getFileList();
	}

	@Override
	public FileVO getFiles(int pd_num) {
		FileVO files= mapDao.getFile(pd_num,"product", "게시글 썸네일");
		return files;
	}

}
