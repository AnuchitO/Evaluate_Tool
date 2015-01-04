package com.spt.evt.service.impl;

import com.spt.evt.dao.PersonDao;
import com.spt.evt.entity.Person;
import com.spt.evt.service.PersonService;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
	public void setData(String dataForm) {
		JSONObject jsonObj = new JSONObject(dataForm);
		Person person = new Person();

		person.setName(jsonObj.getString("firstname"));
		person.setLastName(jsonObj.getString("lastname"));
		person.setGender(jsonObj.getString("gender"));
		person.setEmail(jsonObj.getString("email"));
		person.setUserName(jsonObj.getString("username"));
		person.setPassword(jsonObj.getString("password"));
		person.setPositionName(jsonObj.getString("position"));
		person.setInstitute(jsonObj.getString("institute"));
		person.setPhone(jsonObj.getString("phonenumber"));
		person.setInternship(jsonObj.getString("internship"));
		person.setFacebook(jsonObj.getString("facebook"));
		personDao.persist(person);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Person> findAll() {
		return this.personDao.findAll();
	}

	@Override
	@Transactional
	public void editMemberProfile(String dataform){
		JSONObject jsonObject = new JSONObject(dataform);
		Person person = new Person();

		person.setId(jsonObject.getLong("userId"));
		person.setName(jsonObject.getString("firstname"));
		person.setLastName(jsonObject.getString("lastname"));
		person.setGender(jsonObject.getString("gender"));
		person.setEmail(jsonObject.getString("email"));
		person.setUserName(jsonObject.getString("username"));
		person.setPassword(jsonObject.getString("password"));
		person.setPositionName(jsonObject.getString("position"));
		person.setInstitute(jsonObject.getString("institute"));
		person.setPhone(jsonObject.getString("phonenumber"));
		person.setInternship(jsonObject.getString("internship"));
		person.setFacebook(jsonObject.getString("facebook"));
		personDao.editProfile(person);
	}
	
}