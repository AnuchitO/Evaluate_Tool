package com.spt.evt.dao;

import com.spt.evt.entity.Person;

import java.util.List;

public interface PersonDao {
	public Person findById(Long id);
	public List<Person> findByUserNameAndPassword(String userName, String password);

	public void persist(Person person);
	public List<Person> findAll();
	public void editProfile(Person dataperson);

}
