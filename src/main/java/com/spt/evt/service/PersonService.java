package com.spt.evt.service;

import java.util.List;

import com.spt.evt.entity.Person;

public interface PersonService {
	public Person findById(Long id);
	public List<Person> findByUserNameAndPassword(String userName, String password);

	public String setData(String dataForm);
	public List<Person> findAll();
}
