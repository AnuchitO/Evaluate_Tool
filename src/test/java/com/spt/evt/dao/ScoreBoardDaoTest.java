package com.spt.evt.dao;

import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.entity.Person;
import com.spt.evt.entity.ScoreBoard;
import com.spt.evt.entity.Topic;

/**
 * Created by : Anuchit Prasertsang Created Date : 27/10/2014
 */
public class ScoreBoardDaoTest extends AbstractTestDao {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ScoreBoardDao scoreBoardDao;

	public ScoreBoardDao getScoreBoardDao() {
		return scoreBoardDao;
	}

	public void setScoreBoardDao(ScoreBoardDao scoreBoardDao) {
		this.scoreBoardDao = scoreBoardDao;
	}

	@Test
	public void remark() {
		logger.debug("/*** Begin test ScoreBoardDaoTest() ***/");
	}

	@Test
	public void testFindScoreBoardByCommiteeAndTopicBeNotNull() {
		Person committee = new Person();
		committee.setId(3L);
		
		Topic topic = new Topic();
		topic.setId(1L);
		
		Person examiner = new Person();
		examiner.setId(2L);
		
		ScoreBoard scoreBoard = this.getScoreBoardDao().findByCommiteeAndTopic(committee, topic,examiner);
		Assert.assertNotNull(scoreBoard);
	}

}
