package kr.dbp.naemom.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.dao.ProductOptionDAO;
import kr.dbp.naemom.utils.UploadFileUtils;
import kr.dbp.naemom.vo.DayOFFVO;
import kr.dbp.naemom.vo.FileVO;
import kr.dbp.naemom.vo.Option_accomodationVO;
import kr.dbp.naemom.vo.Option_festivalVO;
import kr.dbp.naemom.vo.Option_landMarkVO;
import kr.dbp.naemom.vo.Option_restrauntVO;
import kr.dbp.naemom.vo.TempOFFVO;

@Service
public class ProductOptionServiceImp implements ProductOptionService{

	@Autowired
	ProductOptionDAO productOptionDao;

	String uploadPath = "D:\\uploadfiles";
	
	@Override
	public boolean deleteFestival(int fo_num) {
		
		return productOptionDao.deleteFestival(fo_num);
	}

	@Override
	public boolean insertFestival(ArrayList<Option_festivalVO> list) {
		if(list==null || list.size()<=0)return false;
		for(Option_festivalVO item : list) {
			if(item.getFo_age()== null) return false;
			if(item.getFo_pd_num()<=0) return false;
			if(item.getFo_price()<=0) return false;
			productOptionDao.insertFestivalOption(item);
		}
		
		return true;
	}

	@Override
	public boolean updateFestival(Option_festivalVO festival) {
		if(festival==null||
				festival.getFo_age()==null||
				festival.getFo_num()<=0||
				festival.getFo_pd_num()<=0||
				festival.getFo_price()<0 
		)return false;
		
		return productOptionDao.updateFestival(festival);
	}

	@Override
	public boolean insertLandmark(ArrayList<Option_landMarkVO> list) {
		if(list==null || list.size()<=0)return false;
			for(Option_landMarkVO item : list) {
				if(item.getLo_age()== null) return false;
				if(item.getLo_pd_num()<=0) return false;
				if(item.getLo_price()<=0) return false;
				productOptionDao.insertLandmarkOption(item);
			}
		
		return true;
	}

	@Override
	public boolean deleteLandmark(int lo_num) {
		return productOptionDao.deleteLandmark(lo_num);
	}

	@Override
	public boolean updateLandmark(Option_landMarkVO landmark) {
		if(landmark==null||
				landmark.getLo_age()==null||
				landmark.getLo_num()<=0||
				landmark.getLo_pd_num()<=0||
				landmark.getLo_price()<0 
		)return false;
		
		return productOptionDao.updateLandmark(landmark);
	}

	@Override
	public boolean updateDayOff(String[] dayOff, int pdNum) {
		 if (dayOff.length == 0) {
		        return true;
		    }
		    if (pdNum <= 0) {
		        return false;
		    }
		    for (String day : dayOff) {
		        DayOFFVO dayoff = productOptionDao.getDayOff(pdNum, day);
		        if (dayoff != null) {
		            if (productOptionDao.deleteDayOff(pdNum, day)<=0) {
		                return false;
		            }
		        }
		    }
		    return true;
	}

	@Override
	public boolean insertDayOff(String[] dayOff, int pdNum) {
		 if (dayOff.length == 0) {
		        return true;
		    }
		    if (pdNum <= 0) {
		        return false;
		    }
		    for (String day : dayOff) {
		        DayOFFVO dayoff = productOptionDao.getDayOff(pdNum, day);
		        if (dayoff == null) {
		        	productOptionDao.insertDayOff(pdNum, day);
		        }
		    }
		    return true;
	}

	@Override
	public boolean insertDayOffTmp(TempOFFVO temp, int productNum) {
		if(temp==null) return false;
		if(productNum<=0) return false;
		
		DayOFFVO dayoff = new DayOFFVO();
		dayoff.setDo_state("임");
		dayoff.setDo_pd_num(productNum);
		System.out.println(temp);
		productOptionDao.insertDayOffTmp(dayoff);
		
		return productOptionDao.insertTmpOff(dayoff.getDo_num(),temp.getTo_start(), temp.getTo_end());
	}

	@Override
	public ArrayList<TempOFFVO> getDayOffTmp(int pd_num) {
		ArrayList<TempOFFVO> list = productOptionDao.getDayOffTmp(pd_num);
		return list;
	}

		@Override
		public boolean insertRestraunt(ArrayList<Option_restrauntVO> list, MultipartFile[] files) {
		    if(list == null || list.size() <= 0 || files == null || files.length <= 0) {
		        return false;
		    }
		    for(int i=0; i<list.size(); i++) {
		        Option_restrauntVO option = list.get(i);
		        if(option.getReo_content() == null || option.getReo_content().trim().length() <= 0 ||
		                option.getReo_name() == null || option.getReo_name().trim().length() <= 0 ||
		                option.getReo_pd_num() <= 0 || option.getReo_price() <= 0) {
		            return false;
		        }
		        if(!productOptionDao.insertRestrauntOption(option)) {
		           return false;
		        }
		       insertRestrauntOptionFile(option.getReo_num(), files[i]);
		    }
		    return true;
		}

		private void insertRestrauntOptionFile(int reo_num, MultipartFile multipartFile) {
			if(reo_num<=0) return;
			if(multipartFile==null || multipartFile.getOriginalFilename()==null) return;
			String fileName="";
			try {
				fileName=UploadFileUtils.uploadFile(uploadPath, multipartFile.getOriginalFilename(), multipartFile.getBytes());
				FileVO file = new FileVO();
				file.setFi_name(fileName);
				file.setFi_ori_name(multipartFile.getOriginalFilename());
				file.setFi_table("restraunt_option");
				file.setFi_table_key(reo_num);
				productOptionDao.insertOptionFile(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		@Override
		public FileVO getFileREOption(int reo_num) {
			if(reo_num<=0) return null;
			return productOptionDao.getFileREOption(reo_num,"restraunt_option");
		}

		@Override
		public boolean deleteRestraunt(int reo_num) {
			return productOptionDao.deleteRestraunt(reo_num);
		}

		@Override
		public boolean updateRestraunt(Option_restrauntVO restraunt) {
			if(restraunt==null) return false;
			if(restraunt.getReo_content().trim().length()<=0||
					restraunt.getReo_name().trim().length()<=0||
					restraunt.getReo_num()<=0||
					restraunt.getReo_pd_num()<=0||
					restraunt.getReo_price()<=0) return false;
			return productOptionDao.updateRestraunt(restraunt);
		}

		@Override
		public boolean updateRestrauntOptionFile(MultipartFile multipartFile, int reo_num) {
			if(multipartFile==null || multipartFile.getOriginalFilename()==null) return false;
			if(reo_num<=0) return false;
			String fileName="";
			try {
				fileName=UploadFileUtils.uploadFile(uploadPath, multipartFile.getOriginalFilename(), multipartFile.getBytes());
				FileVO file = new FileVO();
				file.setFi_name(fileName);
				file.setFi_ori_name(multipartFile.getOriginalFilename());
				file.setFi_table("restraunt_option");
				file.setFi_table_key(reo_num);
				FileVO oriFile=productOptionDao.getFileREOption(reo_num, file.getFi_table());
				if(oriFile !=null) {
					productOptionDao.updateRestrauntOptionFile(file, oriFile.getFi_num());
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return true;
		}

		@Override
		public boolean insertAccomodation(ArrayList<Option_accomodationVO> list, MultipartFile[] files) {
		    if(list == null || list.size() <= 0 || files == null || files.length <= 0) {
		        return false;
		    }
		    for(int i=0; i<list.size(); i++) {
		        Option_accomodationVO option = list.get(i);
		        if(option.getAo_room_detail() == null || option.getAo_room_detail().trim().length() <= 0 ||
		                option.getAo_name() == null || option.getAo_name().trim().length() <= 0 ||
		                option.getAo_pd_num() <= 0 || option.getAo_price() <= 0||
		                option.getAo_room_number() == null ||
		                option.getAo_capacity() <=0) {
		            return false;
		        }
		        if(!productOptionDao.insertAccomodationOption(option)) {
		           return false;
		        }
		       insertAccomodationOptionFile(option.getAo_num(), files[i]);
		    }
			return true;
		}

		private void insertAccomodationOptionFile(int ao_num, MultipartFile multipartFile) {
			if(multipartFile==null || multipartFile.getOriginalFilename()==null) return;
			if(ao_num<=0) return;
			String fileName="";
			System.out.println(multipartFile.getOriginalFilename());
			try {
				fileName=UploadFileUtils.uploadFile(uploadPath, multipartFile.getOriginalFilename(), multipartFile.getBytes());
				FileVO file = new FileVO();
				file.setFi_name(fileName);
				file.setFi_ori_name(multipartFile.getOriginalFilename());
				file.setFi_table("accomodation_option");
				file.setFi_table_key(ao_num);
				productOptionDao.insertOptionFile(file);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}

		@Override
		public FileVO getFileAOption(int ao_num) {
			if(ao_num<=0) return null;
			return productOptionDao.getFileAOption(ao_num,"accomodation_option");
		}
		
		@Override
		public boolean deleteAccomodation(int reo_num) {
			return productOptionDao.deleteAccomodation(reo_num);
		}

		@Override
		public boolean updateAccomodation(Option_accomodationVO option) {
		  if(option.getAo_room_detail() == null || option.getAo_room_detail().trim().length() <= 0 ||
	                option.getAo_name() == null || option.getAo_name().trim().length() <= 0 ||
	                option.getAo_pd_num() <= 0 || option.getAo_price() <= 0||
	                option.getAo_room_number() == null ||
	                option.getAo_capacity() <=0 ||
	                option.getAo_num()<=0) {
	            return false;
	        }
			return productOptionDao.updateAccomodation(option);
		}

		@Override
		public boolean updateAccomodationOptionFile(MultipartFile multipartFile, int reo_num) {
			if(multipartFile==null || multipartFile.getOriginalFilename()==null) return false;
			if(reo_num<=0) return false;
			String fileName="";
			try {
				fileName=UploadFileUtils.uploadFile(uploadPath, multipartFile.getOriginalFilename(), multipartFile.getBytes());
				FileVO file = new FileVO();
				file.setFi_name(fileName);
				file.setFi_ori_name(multipartFile.getOriginalFilename());
				file.setFi_table("accomodation_option");
				file.setFi_table_key(reo_num);
				FileVO oriFile=productOptionDao.getFileAOption(reo_num, file.getFi_table());
				if(oriFile !=null) {
					productOptionDao.updateAccomodationOptionFile(file, oriFile.getFi_num());
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return true;
		}

}
