package com.spt.evt.dao;

import java.util.List;

import com.spt.evt.entity.MemberRegister;

public interface MemberRegisterDao {

	public void save(MemberRegister memberRegister);

	public List<MemberRegister> findAll();

}
