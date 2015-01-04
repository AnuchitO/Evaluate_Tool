package com.spt.evt.service;

import com.spt.evt.entity.Person;

import java.util.List;

public interface PersonService {
	public Person findById(Long id);
	public List<Person> findByUserNameAndPassword(String userName, String password);

	public void setData(String dataForm);
	public List<Person> findAll();
	public void editMemberProfile(String dataform);
}
