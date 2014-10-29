package com.spt.evt.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spt.evt.dao.BaseDao;
import com.spt.evt.dao.CourseDao;
import com.spt.evt.dao.ScoreBoardDao;
import com.spt.evt.dao.SubjectDao;
import com.spt.evt.dao.TopicDao;
import com.spt.evt.entity.Base;
import com.spt.evt.entity.Course;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.ScoreBoard;
import com.spt.evt.entity.Subject;
import com.spt.evt.entity.Topic;
import com.spt.evt.service.BaseService;
import com.spt.evt.service.CourseService;
import com.spt.evt.service.ScoreBoardService;
import com.spt.evt.service.SubjectService;
import com.spt.evt.service.TopicService;

@Service
public class ScoreBoardServiceImpl implements ScoreBoardService {
	private static final Logger logger = LoggerFactory
			.getLogger(ScoreBoardServiceImpl.class);

	@Autowired
	private ScoreBoardDao scoreBoardDao;

	public ScoreBoardDao getScoreBoardDao() {
		return scoreBoardDao;
	}

	public void setScoreBoardDao(ScoreBoardDao scoreBoardDao) {
		this.scoreBoardDao = scoreBoardDao;
	}

	@Override
	public ScoreBoard findByCommiteeAndTopic(Person committee, Topic topic,
			Person examiner) {
		return this.getScoreBoardDao().findByCommiteeAndTopic(committee, topic,
				examiner);
	}

}