package com.spt.evt.service;

import static org.hamcrest.core.Is.is;

import java.util.List;

import org.json.JSONObject;
import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.dao.SubjectDao;
import com.spt.evt.entity.Course;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.Subject;
import com.spt.evt.entity.Topic;

/**
 * Created by : Anuchit Prasertsang Created Date : 28/10/2014
 */
public class PersonServiceTest extends AbstractTestService {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private PersonService personService;

	public PersonService getPersonService() {
		return personService;
	}

	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}

	@Test
	public void remark() {
		logger.debug("-= Begin test PersonServiceTest() =-");
	}

	@Test
	public void testFindPersonByIdShouldBeNotNull() {
		Person person = this.getPersonService().findById(1L);
		Assert.assertNotNull(person);
	}

}
