package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.dao.ProductDAO;
import kr.dbp.naemom.utils.UploadFileUtils;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.ProductCategoryVO;
import kr.dbp.naemom.vo.ProductVO;

@Service
public class ProductServiceImp implements ProductService{

	@Autowired
	ProductDAO productDao;
	
	String uploadPath = "D:\\uploadfiles";

	@Override
	public boolean insertProduct(ProductVO product, MultipartFile[] files) {
		if(product ==null) return false;
		if(product.getPd_capacity() <= 0 || 
			product.getPd_close_time() == null || 
			product.getPd_content().trim().length() ==0 ||
			product.getPd_open_time() == null ||
			product.getPd_parking().trim().length() ==0 ||
			product.getPd_registerd_address().trim().length() ==0 ||
			product.getPd_street_address().trim().length() ==0 ||
			product.getPd_subtitle().trim().length() ==0||
			product.getPd_title().trim().length() ==0) return false;
		productDao.insertProduct(product);
		if(files.length>0) {
			uploadThumbnail(files[1], product.getPd_num());
		}
		insertProductOption(product.getPd_num());
		if(uploadFilesDetail(files, product.getPd_num())) return false;
		return true;
		
	}

	

	private void insertProductOption(int pd_pc_num) {
		
	}
	//썸네일 등록메서드
	private boolean uploadThumbnail(MultipartFile thm, int pd_num) {
		if(thm==null) return false;
		String fileName="";
		try {
			fileName=UploadFileUtils.uploadFile(uploadPath, thm.getOriginalFilename(), thm.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		FileVO fileVo = new FileVO("게시글 썸네일", thm.getOriginalFilename(), fileName, pd_num);
		productDao.insertFile(fileVo);
		return true;
	}
	//대표이미지 등록 메서드
	private boolean uploadFilesDetail(MultipartFile[] files, int i) {
		if(files == null || files.length == 0)
			return false;;
		for(MultipartFile file : files) {
			if(files[1]==file)continue;
			if(file == null || file.getOriginalFilename().length() == 0)
				continue;
			try {
				String path = UploadFileUtils.uploadFile(uploadPath, 
						file.getOriginalFilename(), file.getBytes());
				FileVO fileVo = new FileVO("게시글 대표이미지",file.getOriginalFilename(),path, 
						i);
				productDao.insertFile(fileVo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return true;
	}

	@Override
	public ProductVO getProduct(int i) {
		if(i<=0) return null;
		return productDao.selectProductByNum(i);
	}

	@Override
	public ArrayList<ProductCategoryVO> getCategory() {
		ArrayList<ProductCategoryVO> ctList=productDao.getCategoryList();
		return ctList;
	}



	@Override
	public ArrayList<ProductVO> getProductList() {
		return productDao.getProductList();
	}



	@Override
	public ArrayList<FileVO> getFiles(int pd_num) {
		if(pd_num<0) return null;
		ArrayList<FileVO> files= productDao.getFile(pd_num);
		files.remove(0);
		return files ;
	}



	@Override
	public ArrayList<FileVO> getRandomThumbNail() {
		ArrayList<FileVO> list = new ArrayList<FileVO>();
		int totalCount = productDao.getTotalCountOfProduct();
		int random;
		int amount =10;
		String Thum = "썸네일";
		FileVO file;
		for(int i=0; i<amount; i++) {
			random = (int)(Math.random()*totalCount+1);
			file = productDao.getThumbNail(random, Thum);
			list.add(file);
			
		}
		
		return list;
	}



	@Override
	public ArrayList<ProductVO> getRandomProduct() {
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		int totalCount = productDao.getTotalCountOfProduct();
		int random;
		int amount =10;
		ProductVO file;
		for(int i=0; i<amount; i++) {
			random = (int)(Math.random()*totalCount+1);
			file = productDao.selectProductByNum(random);
			list.add(file);
			
		}
		return list;	
		}
}
