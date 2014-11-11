package com.spt.evt.dao;

import java.util.List;

import com.spt.evt.entity.Person;

public interface PersonDao {
	public Person findById(Long id);
	public List<Person> findByUserNameAndPassword(String userName, String password);
}
