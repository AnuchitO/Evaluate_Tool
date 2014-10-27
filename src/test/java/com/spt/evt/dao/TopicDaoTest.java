package com.spt.evt.dao;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.entity.Subject;
import com.spt.evt.entity.Topic;

/**
 * Created by : Anuchit Prasertsang Created Date : 27/10/2014
 */
public class TopicDaoTest extends AbstractTestDao {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private TopicDao topicDao;

	public TopicDao getTopicDao() {
		return topicDao;
	}

	public void setTopicDao(TopicDao topicDao) {
		this.topicDao = topicDao;
	}

	@Test
	public void remark() {
		logger.debug("/*** Begin test TopicDaoTest() ***/");
	}

	@Test
	public void testFindSubjectBySubjectShouldBeNotNull() {
		Subject subject = new Subject();
		subject.setId(1L);
		List<Topic> topics = this.getTopicDao().findBySubject(subject);
		Assert.assertNotNull(topics);
	}

}
