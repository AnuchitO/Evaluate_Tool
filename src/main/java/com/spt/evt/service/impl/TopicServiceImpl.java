package com.spt.evt.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spt.evt.dao.TopicDao;
import com.spt.evt.entity.Subject;
import com.spt.evt.entity.Topic;
import com.spt.evt.service.TopicService;

@Service
public class TopicServiceImpl implements TopicService {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(TopicServiceImpl.class);

	@Autowired
	private TopicDao topicDao;

	@Override
	public List<Topic> findBySubject(Subject subject) {
		return this.topicDao.findBySubject(subject);
	}

	@Override
	public Topic findById(Long id){
		return this.topicDao.findById(id);
	}
}