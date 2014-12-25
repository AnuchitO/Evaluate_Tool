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
	private static final Logger LOGGER = LoggerFactory.getLogger(TopicDaoTest.class);

	@Autowired
	private TopicDao topicDao;
	@Autowired
	private SubjectDao subjectDao;

	@Test
	public void testFindSubjectBySubjectShouldBeNotNull() {
		Subject subject = new Subject();
		subject.setId(1L);
		List<Topic> topics = this.topicDao.findBySubject(subject);
		Assert.assertNotNull(topics);
	}

	@Test
	public void testFindTopicByIdShouldBeNotNull() {
		Topic topic = this.topicDao.findById(1L);
		Assert.assertNotNull(topic);
	}

	@Test
	public void testPersistTopic() {
		Subject subject = subjectDao.findById(1L);
		Topic topic = new Topic();
		topic.setName("Topic Edit");
		topic.setDescription("Topic Edit");
		topic.setSubject(subject);
		topicDao.persist(topic);
		Assert.assertNotNull(topicDao.findById(59L));
	}

	@Test
	public void testUpdateTopic(){
		Subject subject = subjectDao.findById(1L);
		Topic topic = topicDao.findById(1L);
		topic.setId(1L);
		topic.setName("Topic Edit");
		topic.setDescription("Descrip Edit");
		topic.setSubject(subject);
		topicDao.update(topic);
		Topic topicAffter = topicDao.findById(1L);
		Assert.assertTrue("Topic Edit".equals(topicAffter.getName()));
		Assert.assertTrue("Descrip Edit".equals(topicAffter.getDescription()));
	}

}
