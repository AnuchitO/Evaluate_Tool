package com.spt.evt.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spt.evt.dao.BaseDao;
import com.spt.evt.entity.Base;
import com.spt.evt.entity.Person;
import com.spt.evt.service.BaseService;
import com.spt.evt.service.CourseService;
import com.spt.evt.service.PersonService;
import com.spt.evt.service.ScoreBoardService;
import com.spt.evt.service.SubjectService;
import com.spt.evt.service.TopicService;

@Service
public class ProviderService {
	private static final Logger logger = LoggerFactory
			.getLogger(ProviderService.class);

	@Autowired
	private CourseService courseService;
	@Autowired
	private SubjectService subjectService;
	@Autowired
	private TopicService topicService;
	@Autowired
	private ScoreBoardService scoreBoardService;
	@Autowired
	private PersonService personService;

	public PersonService getPersonService() {
		return personService;
	}

	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}

	public CourseService getCourseService() {
		return courseService;
	}

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	public SubjectService getSubjectService() {
		return subjectService;
	}

	public void setSubjectService(SubjectService subjectService) {
		this.subjectService = subjectService;
	}

	public TopicService getTopicService() {
		return topicService;
	}

	public void setTopicService(TopicService topicService) {
		this.topicService = topicService;
	}

	public ScoreBoardService getScoreBoardService() {
		return scoreBoardService;
	}

	public void setScoreBoardService(ScoreBoardService scoreBoardService) {
		this.scoreBoardService = scoreBoardService;
	}

}