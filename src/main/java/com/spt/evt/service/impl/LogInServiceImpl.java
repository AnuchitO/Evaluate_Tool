package com.spt.evt.service.impl;

import java.util.List;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spt.evt.dao.PersonDao;
import com.spt.evt.entity.Person;
import com.spt.evt.service.LogInService;

@Service
public class LogInServiceImpl extends ProviderService implements LogInService {

	private static final Logger LOGGER = LoggerFactory
			.getLogger(LogInServiceImpl.class);
	
	@Autowired
	private PersonDao personDao;

	@Override
	public JSONObject checkUserNamePassword(String userName, String password) {
		JSONObject personDetail = null;
		List<Person> persons = this.getPersonService().findByUserNameAndPassword(userName, password);
		for(Person person : persons){
			personDetail = new JSONObject();
			personDetail.put("id", person.getId());
			personDetail.put("name", person.getName());
			personDetail.put("lastName", person.getLastName());
		}
		return personDetail;
	}

}
