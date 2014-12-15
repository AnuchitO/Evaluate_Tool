package com.spt.evt.service.impl;

import java.util.List;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spt.evt.dao.PersonDao;
import com.spt.evt.entity.Person;
import com.spt.evt.service.PersonService;
import org.springframework.transaction.annotation.Transactional;
import javax.persistence.EntityManager;

@Service
public class PersonServiceImpl implements PersonService {
	private static final Logger LOGGER = LoggerFactory.getLogger(PersonServiceImpl.class);
	
	@Autowired
	private PersonDao personDao;

	@Override
	@Transactional(readOnly = true)
	public Person findById(Long id) {
		return this.personDao.findById(id);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Person> findByUserNameAndPassword(String userName, String password) {
		
		return this.personDao.findByUserNameAndPassword(userName, password);
	}
	
	@Override
	@Transactional
	public String setData(String dataForm) {

		JSONObject jsonObj = new JSONObject(dataForm);
		
		Person person = new Person();

		person.setName(jsonObj.getString("firstname"));
		person.setLastName(jsonObj.getString("lastname"));
		person.setGender(jsonObj.getString("gender"));
		person.setEmail(jsonObj.getString("email"));
		person.setReenterEmail(jsonObj.getString("reemail"));
		person.setPassword(jsonObj.getString("password"));
		person.setReenterPassword(jsonObj.getString("repassword"));
		person.setPositionA(jsonObj.getString("position").toString());
		person.setInstitute(jsonObj.getString("institute"));
		person.setPhoneNumber(jsonObj.getString("phonenumber"));
		person.setInternship(jsonObj.getString("internship"));
		person.setFacebook(jsonObj.getString("facebook"));
		System.out.println("SetValue");
		
		personDao.persist(person);
		System.out.println("Persist Successful");

		return null;
	}

	@Override
	@Transactional(readOnly = true)
	public List<Person> findAll() {
		return this.personDao.findAll();
	}
	
}