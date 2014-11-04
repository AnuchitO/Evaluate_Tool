package com.spt.evt.dao;

import static org.hamcrest.core.Is.is;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by : Anuchit Prasertsang Created Date : 21/10/2014
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ActiveProfiles("test")
@Configurable
@ContextConfiguration({ "classpath:META-INF/spring/evaluatetool-context.xml" })
public abstract class AbstractTestDao {
	Logger logger = LoggerFactory.getLogger(AbstractTestDao.class);

	@Autowired
	private PersonDao personDao;
	@Autowired
	private TopicDao topicDao;

	public TopicDao getTopicDao() {
		return topicDao;
	}

	public void setTopicDao(TopicDao topicDao) {
		this.topicDao = topicDao;
	}

	public PersonDao getPersonDao() {
		return personDao;
	}

	public void setPersonDao(PersonDao personDao) {
		this.personDao = personDao;
	}

	@Before
	public void setup() {

	}

	@Test
	public void testSampleAbstractDao() {
		Assert.assertThat("\"testSampleAbstractDao\"",
				is("\"testSampleAbstractDao\""));
	}

	@After
	public void after() {

	}

}
