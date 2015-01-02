package com.spt.evt.service.impl;

import java.util.List;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spt.evt.dao.MemberRegisterDao;
import com.spt.evt.entity.MemberRegister;
import com.spt.evt.service.MemberRegisterService;

@Service
public class MemberRegisterServiceImpl implements MemberRegisterService {

	private static final Logger LOGGER = LoggerFactory
			.getLogger(MemberRegisterServiceImpl.class);
	
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
		memberRegister.setGender(jsonObj.getString("gender"));
		memberRegister.setEmail(jsonObj.getString("email"));
		memberRegister.setReenterEmail(jsonObj.getString("reemail"));
		memberRegister.setPassword(jsonObj.getString("password"));
		memberRegister.setReenterPassword(jsonObj.getString("repassword"));
		memberRegister.setPositionA(jsonObj.getString("position").toString());
		memberRegister.setInstitute(jsonObj.getString("institute"));
		memberRegister.setPhoneNumber(jsonObj.getString("phonenumber"));
		memberRegister.setInternship(jsonObj.getString("internship"));
		memberRegister.setFacebook(jsonObj.getString("facebook"));
		memberRegisterDao.save(memberRegister);
		return null;
	}

	@Override
	public List<MemberRegister> findAll() {
		return this.memberRegisterDao.findAll();
	}

}
