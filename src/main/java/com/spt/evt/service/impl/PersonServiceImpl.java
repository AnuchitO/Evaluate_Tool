package com.spt.evt.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spt.evt.dao.PersonDao;
import com.spt.evt.entity.Person;
import com.spt.evt.service.PersonService;

@Service
public class PersonServiceImpl implements PersonService {
	private static final Logger LOGGER = LoggerFactory.getLogger(PersonServiceImpl.class);
	
	@Autowired
	private PersonDao personDao;

	@Override
	public Person findById(Long id) {
		return this.personDao.findById(id);
	}

	@Override
	public List<Person> findByUserNameAndPassword(String userName, String password) {
		
		return this.personDao.findByUserNameAndPassword(userName, password);
	}
	
	@Override
	public List<Person> findAll() {
		
		return this.personDao.findAll();
	}
}