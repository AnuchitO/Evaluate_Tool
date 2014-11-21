package com.spt.evt.service;

import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.entity.Person;

/**
 * Created by : Anuchit Prasertsang Created Date : 28/10/2014
 */
public class PersonServiceTest extends AbstractTestService {
	private static final Logger LOGGER = LoggerFactory.getLogger(PersonServiceTest.class);

	@Autowired
	private PersonService personService;

	@Test
	public void testFindPersonByIdShouldBeNotNull() {
		Person person = this.personService.findById(1L);
		Assert.assertNotNull(person);
	}

}
