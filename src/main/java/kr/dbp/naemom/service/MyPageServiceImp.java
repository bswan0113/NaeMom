package kr.dbp.naemom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.dbp.naemom.dao.MyPageDAO;
import kr.dbp.naemom.utils.UploadFileUtils;
import kr.dbp.naemom.vo.MemberVO;
import kr.dbp.naemom.vo.Member_profileVO;

@Service
public class MyPageServiceImp implements MyPageService{

	@Autowired
	MyPageDAO myPageDao;
	
	String uploadPath = "C:\\uploadfiles";
	
	@Override
	public MemberVO getUserInfo(MemberVO user) {
	if(user==null||
				user.getMe_authority()<1||
				user.getMe_id()==null) return null;
		
		return myPageDao.getUserInfo(user.getMe_id());
	}
	
	@Override
	public boolean updateMember(MemberVO member) {
		if(member==null) return false;
		if(member.getMe_authority()<1 ||
				member.getMe_birthday()==null||
				member.getMe_nickname().trim().length()<=0||
				member.getMe_registered_address().trim().length()<=0||
				member.getMe_name().trim().length()<=0||
				member.getMe_phone().trim().length()<=0||
				member.getMe_street_address().trim().length()<=0
				) return false;
		
		
			return myPageDao.updateMember(member)>=0;
	}

	@Override
	public boolean updateProfileImg(MultipartFile file, String me_id) {
		if(me_id==null || me_id.trim().length()<=0) return false;
		if(file==null|| file.getOriginalFilename().trim().length()<=0) return false;
		Member_profileVO upload = new Member_profileVO();
		String fileName ="";
		try {
			fileName=UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			upload.setMf_name(fileName);
			upload.setMf_ori_name(file.getOriginalFilename());
			Member_profileVO oriProfile = myPageDao.getProfileImg(me_id);
			
			
			System.out.println("오리  : "+oriProfile);
			if(oriProfile==null ||  oriProfile.getMf_ori_name()==null) {
				return myPageDao.insertProfileImg(upload, me_id);
			}else {
				upload.setMf_num(oriProfile.getMf_num());
				upload.setMf_me_id(me_id);
				
				return myPageDao.updateProfileImg(upload)>=0;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return true;
	}

	@Override
	public Member_profileVO getProfileImg(String me_id) {
		if(me_id==null || me_id.trim().length()<=0) return null;
		
		
		return myPageDao.getProfileImg(me_id);
	}

}
