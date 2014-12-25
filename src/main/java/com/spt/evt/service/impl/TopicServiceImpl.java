package com.spt.evt.service.impl;

import java.util.List;

import com.spt.evt.entity.Course;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.json.JSONObject;

import com.spt.evt.dao.TopicDao;
import com.spt.evt.dao.SubjectDao;
import com.spt.evt.entity.Subject;
import com.spt.evt.entity.Topic;
import com.spt.evt.service.TopicService;
import com.spt.evt.service.SubjectService;

import org.springframework.transaction.annotation.Transactional;

@Service
public class TopicServiceImpl implements TopicService {
	private static final Logger LOGGER = LoggerFactory
			.getLogger(TopicServiceImpl.class);

	@Autowired
	private TopicDao topicDao;
	@Autowired
	private SubjectDao subjectDao;
	@Autowired
	private SubjectService subjectService;

	@Override
	public List<Topic> findBySubject(Subject subject) {
		return this.topicDao.findBySubject(subject);
	}

	@Transactional
	public void setData(String dataForm) {
		JSONObject jsonObj = new JSONObject(dataForm);
		Topic topic = new Topic();
		Long passIdToLong = Long.parseLong(jsonObj.getString("id"));
		Subject subject = subjectService.findById(passIdToLong);
		topic.setName(jsonObj.getString("topicName"));
		topic.setDescription(jsonObj.getString("topicDescription"));
		topic.setSubject(subject);	
		topicDao.persist(topic);
	}

	@Override
	public Topic findById(Long id) {
		return this.topicDao.findById(id);
	}

	@Override
	@Transactional
	public void deleteDataById(Long id) {
		Topic topic = findById(id);
		this.topicDao.removeTopic(topic);
	}

	@Override
	@Transactional
	public void editData(String dataForm) {
		JSONObject jsonObj = new JSONObject(dataForm);
		Topic topic = new Topic();
		Long passIdToLong = Long.parseLong(jsonObj.getString("idSubject"));
		Subject subject = subjectService.findById(passIdToLong);
		topic.setId(Long.parseLong(jsonObj.getString("idTopic")));
		topic.setName(jsonObj.getString("topicNameEdit"));
		topic.setDescription(jsonObj.getString("topicDescriptionEdit"));
		topic.setSubject(subject);
		topicDao.update(topic);
	}

}