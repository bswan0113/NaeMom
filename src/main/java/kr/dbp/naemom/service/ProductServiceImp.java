package kr.dbp.naemom.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.dao.ProductDAO;
import kr.dbp.naemom.pagination.Criteria;
import kr.dbp.naemom.utils.UploadFileUtils;
import kr.dbp.naemom.vo.DayOFFVO;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.Option_accomodationVO;
import kr.dbp.naemom.vo.Option_restrauntVO;
import kr.dbp.naemom.vo.ProductCategoryVO;
import kr.dbp.naemom.vo.ProductVO;
import kr.dbp.naemom.vo.WishVO;

@Service
public class ProductServiceImp implements ProductService{

	@Autowired
	ProductDAO productDao;
	

	String uploadPath = "D:\\uploadfiles";
//	String uploadPath = "/Users/hyunkyulee/final/Uploadfiles";


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
		uploadFilesDetail(files, product.getPd_num());
		return true;
		
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
		fileVo.setFi_table("product");
		productDao.insertFile(fileVo);
		return true;
	}
	//대표이미지 등록 메서드
	private void uploadFilesDetail(MultipartFile[] files, int i) {
		if(files == null || files.length == 0)
			return;
		for(MultipartFile file : files) {
			if(files[1]==file)continue;
			if(file == null || file.getOriginalFilename().length() == 0)
				continue;
			try {
				String path = UploadFileUtils.uploadFile(uploadPath, 
						file.getOriginalFilename(), file.getBytes());
				FileVO fileVo = new FileVO("게시글 대표이미지",file.getOriginalFilename(),path, 
						i);
				fileVo.setFi_table("product");
				productDao.insertFile(fileVo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	@Override
	public ProductVO getProduct(int i) {
		if(i<=0) return null;
		ProductVO product =productDao.selectProductByNum(i);
		return product;
	}







	@Override
	public ArrayList<ProductCategoryVO> getCategory() {
		ArrayList<ProductCategoryVO> ctList=productDao.getCategoryList();
		return ctList;
	}



	@Override
	public ArrayList<ProductVO> getProductList(Criteria cri) {
		return productDao.getProductList(cri);
	}



	@Override
	public ArrayList<FileVO> getFiles(int pd_num) {
		if(pd_num<0) return null;
		ArrayList<FileVO> files= productDao.getFile(pd_num,"product");
		files.remove(0);
		return files ;
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
	
	@Override
	public ArrayList<FileVO> getThumbNailByRandomProduct(ArrayList<ProductVO> randomProduct) {
		if(randomProduct==null || randomProduct.size()<0) return null;
		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		FileVO file =null;
		String Thum ="썸네일";
		for(int i=0; i<randomProduct.size(); i++) {
			file=productDao.getThumbNail(randomProduct.get(i).getPd_num(), Thum,"product");
			fileList.add(file);
		}

		return fileList;
	}



	@Override
	public WishVO getWish(String me_id, int pd_num) {
		WishVO wish = productDao.getWish(me_id, pd_num);
		return wish;
	}



	@Override
	public int likeUpdate(String me_id, int pd_num, int li_state) {
		if(me_id.trim().length()==0) return 0;
		if(pd_num<0) return 0;
		if(li_state == -1) {
			productDao.deleteWish(me_id,pd_num);
			return -1;
		}
		int res;
		if(productDao.getWish(me_id, pd_num) ==null) {
			res=1;
			productDao.insertWish(me_id,pd_num);}
		else {
			res=-1;
			productDao.deleteWish(me_id,pd_num);
		}
		return res;
	}



	@Override
	public void updateViewCount(int pd_num) {
		productDao.updateViewCount(pd_num);
		
	}



	@Override
	public ArrayList<Object> getLandMarkOption(int pd_num) {
		return productDao.getLandMarkOption(pd_num);
	}



	@Override
	public ArrayList<Object> getRestrauntOption(int pd_num) {
				 
		return productDao.getRestrauntOption(pd_num);
	}



	@Override
	public ArrayList<Object> getAcomodationOption(int pd_num) {
		return productDao.getAcomodationOption(pd_num);
	}



	@Override
	public ArrayList<Object> getFestivalOption(int pd_num) {
		return productDao.getFestivalOption(pd_num);
	}







	@Override
	public double getRatingAvg(int pd_num) {
		if(pd_num<0) return -1;
		Double rating = productDao.getReviewAvg(pd_num);
		return rating;
	}






	@Override
	public FileVO getAoFileByOption(Option_accomodationVO optAcc) {
		if(optAcc==null) return new FileVO();
		FileVO file = productDao.getAoFileByOption(optAcc.getAo_num(),"accomodation_option");
		if(file==null) return new FileVO();
		return file;
	}



	@Override
	public FileVO getReoFileByOption(Option_restrauntVO optReo) {
		if(optReo==null) return new FileVO();
		FileVO file = productDao.getReoFileByOption(optReo.getReo_num(),"restraunt_option");
		if(file==null) return new FileVO();
		return file;
	}



	@Override
	public FileVO getThumbnail(int pd_num) {
		if(pd_num<0) return null;
		return productDao.getThumbNail(pd_num, "썸네일", "product");
	}



	@Override
	public boolean deleteProduct(int number) {
		if(number<=0) return false;
		return productDao.deleteProduct(number)!=0;
	}






	@Override
	public boolean updateProduct(ProductVO product) {
		if(product ==null) return false;
		if(product.getPd_num()<=0) return false;
		if(product.getPd_capacity() <= 0 || 
			product.getPd_close_time() == null || 
			product.getPd_content().trim().length() ==0 ||
			product.getPd_open_time() == null ||
			product.getPd_parking().trim().length() ==0 ||
			product.getPd_registerd_address().trim().length() ==0 ||
			product.getPd_street_address().trim().length() ==0 ||
			product.getPd_subtitle().trim().length() ==0||
			product.getPd_title().trim().length() ==0) return false;
		return productDao.updateProduct(product) >= 0;
	}



	@Override
	public boolean updateThumbnail(MultipartFile uploadFile, int fi_num) {
		if(fi_num<=0) return false;
		if(uploadFile==null || uploadFile.getOriginalFilename().length()<=0) return false;
		
		String fileName="";
		try {
			fileName=UploadFileUtils.uploadFile(uploadPath, uploadFile.getOriginalFilename(), uploadFile.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return  productDao.updateThumbNail(fi_num,"product", uploadFile.getOriginalFilename(), fileName,"썸네일")>=0;
		
	}



	@Override
	public boolean deleteFile(int fi_num) {
		return productDao.deleteFile(fi_num)!=0;
	}



	@Override
	public boolean updateProductFiles(MultipartFile[] files, int i) {
		if(files == null || files.length == 0)
			return false;
		for(MultipartFile file : files) {
			if(file == null || file.getOriginalFilename().length() == 0)
				continue;
			try {
				String path = UploadFileUtils.uploadFile(uploadPath, 
						file.getOriginalFilename(), file.getBytes());
				FileVO fileVo = new FileVO("게시글 대표이미지",file.getOriginalFilename(),path, 
						i);
				fileVo.setFi_table("product");
				productDao.insertFile(fileVo);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}



	@Override
	public int getProductCount() {
		return productDao.getProductCount();
	}



	@Override
	public ArrayList<DayOFFVO> getDayOff(int pd_num) {
		ArrayList<DayOFFVO> dayoff =productDao.getDayOff(pd_num);
		return dayoff;
	}

	

	@Override
	public void recentlyCookie(int pd_num, HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		Cookie currentProduct = null;
		String cookieName = "recentProducts";
		String recentProducts = null;
		int cookieMaxAge = 60 * 60 * 24;
		if (cookies == null || cookies.length == 0)
			return;
		for(int i=0; i<cookies.length; i++) {
			if(cookieName.equals(cookies[i].getName())) {
				currentProduct = cookies[i];
				break;
			}
		}
		if(currentProduct == null) {
		    currentProduct = new Cookie(cookieName, String.valueOf(""));
		}

	    // 최근 본 상품 목록을 쿠키에 저장
		recentProducts = currentProduct.getValue();
		String[] prNums = recentProducts.split("_");
		List<String> prNumList = new ArrayList<String>(Arrays.asList(prNums));
		int index = prNumList.indexOf("" + pd_num);
		if(index >= 0){
			prNumList.remove(index);
		}
		
		int maxProductNum = 5;
		if(prNumList.size() >= maxProductNum){ // 변경
	        prNumList.remove(maxProductNum-1); // 변경
	    }
		prNumList.add(0, "" + pd_num);
		recentProducts = String.join("_", prNumList);
		
		currentProduct.setValue(recentProducts);
		currentProduct.setMaxAge(cookieMaxAge);
		currentProduct.setPath("/");
	    response.addCookie(currentProduct);
	}
	



















}
