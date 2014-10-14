package com.spt.evt.service.impl;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spt.evt.dao.MemberRegisterDao;
import com.spt.evt.entity.MemberRegister;
import com.spt.evt.service.MemberRegisterService;

@Service
public class MemberRegisterServiceImpl implements MemberRegisterService {

	@Autowired
	private MemberRegisterDao memberRegisterDao;
	
	public MemberRegisterDao getMemberRegisterDao() {
		return memberRegisterDao;
	}

	public void setMemberRegisterDao(MemberRegisterDao memberRegisterDao) {
		this.memberRegisterDao = memberRegisterDao;
	}

	@Override
	public String setData(String dataForm) {
		
		JSONObject jsonObj = new JSONObject(dataForm);
		
		MemberRegister memberRegister = new MemberRegister();
		memberRegister.setFirstName(jsonObj.getString("firstname"));
		memberRegister.setLastName(jsonObj.getString("lastname"));
		memberRegister.setEmail(jsonObj.getString("email"));
		memberRegister.setPassword(jsonObj.getString("password"));
		//memberRegister.set(jsonObj.getString(""));
		
		memberRegisterDao.save(memberRegister);
		System.out.println("SSSSSSSSSSSSS");
		return null;
	}
	
//	public static void main(String[] args){
//		String dataForm="{\"firstname\":\"patipol\",\"lastname\":\"AS\",\"email\":\"dsd\",\"reemail\":\"ee\",\"password\":\"\",\"repassword\":\"\",\"institute\":\"\",\"phonenumber\":\"\",\"facebook\":\"\"}";
//		
//		
//		System.out.println("a"+jsonObj.getString("firstname"));
//		
//	}

}
