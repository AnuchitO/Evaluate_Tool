package com.spt.evt.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spt.evt.dao.ScoreBoardDao;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.ScoreBoard;
import com.spt.evt.entity.Topic;
import com.spt.evt.service.ScoreBoardService;

@Service
public class ScoreBoardServiceImpl implements ScoreBoardService {
	private static final Logger logger = LoggerFactory
			.getLogger(ScoreBoardServiceImpl.class);

	@Autowired
	private ScoreBoardDao scoreBoardDao;

	@Override
	public ScoreBoard findByCommiteeAndTopicAndExaminer(Person committee, Topic topic,
			Person examiner) {
		return scoreBoardDao.findByCommiteeAndTopicAndExaminer(committee, topic,
				examiner);
	}

	@Override
	public void save(ScoreBoard scoreBoard) {
		scoreBoardDao.save(scoreBoard);		
	}

	@Override
	public void saveOrUpdate(ScoreBoard scoreBoard) {
		scoreBoardDao.saveOrUpdate(scoreBoard);		
	}


}