package com.spt.evt.dao;

import com.spt.evt.entity.Person;

import java.util.List;

public interface PersonEntityManagerDao {
	public Person findById(Long id);
	public List<Person> findByUserNameAndPassword(String userName, String password);
    public void persist(Person person);
    void remove(Person person);
    public Person merge(Person person);
    public void flush();

}
