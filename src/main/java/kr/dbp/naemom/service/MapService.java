package kr.dbp.naemom.service;

import java.util.ArrayList;

import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.ProductVO;

public interface MapService {

	ArrayList<ProductVO> getProductList();

	ArrayList<FileVO> getFileList();

	FileVO getFiles(int pd_num);

}
