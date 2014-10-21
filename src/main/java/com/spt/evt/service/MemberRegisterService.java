package com.spt.evt.service;

import java.util.List;

import com.spt.evt.entity.MemberRegister;

public interface MemberRegisterService {
	
	public String setData(String dataForm);

	public List<MemberRegister> findAll();

}
