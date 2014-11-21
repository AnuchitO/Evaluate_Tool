package com.spt.evt.service;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.entity.Subject;
import com.spt.evt.entity.Topic;

/**
 * Created by : Anuchit Prasertsang Created Date : 28/10/2014
 */
public class TopicServiceTest extends AbstractTestService {
	private static final Logger LOGGER = LoggerFactory.getLogger(TopicServiceTest.class);

	@Autowired
	private TopicService topicservice;

	@Test
	public void testFindSubjectBySubjectShouldBeNotNull() {
		Subject subject = new Subject();
		subject.setId(1L);
		List<Topic> topics = this.topicservice.findBySubject(subject);
		Assert.assertNotNull(topics);
	}

}
