package com.spt.evt.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.entity.Person;
import com.spt.evt.entity.Subject;
import com.spt.evt.entity.Topic;

/**
 * Created by : Anuchit Prasertsang Created Date : 28/10/2014
 */
public class PersonDaoTest extends AbstractTestDao {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private PersonDao personDao;

	public PersonDao getPersonDao() {
		return personDao;
	}

	public void setPersonDao(PersonDao personDao) {
		this.personDao = personDao;
	}

	@Test
	public void remark() {
		logger.debug("/*** Begin test PersonDaoTest() ***/");
	}

	@Test
	public void testFindPersonByIdShouldBeNotNull() {
		Person person = this.getPersonDao().findById(1L);
		Assert.assertNotNull(person);
	}

}
