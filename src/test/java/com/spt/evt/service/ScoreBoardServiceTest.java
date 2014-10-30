package com.spt.evt.service;

import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.entity.Person;
import com.spt.evt.entity.ScoreBoard;
import com.spt.evt.entity.Topic;

/**
 * Created by : Anuchit Prasertsang Created Date : 28/10/2014
 */
public class ScoreBoardServiceTest extends AbstractTestService {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ScoreBoardService scoreBoardService;

	public ScoreBoardService getScoreBoardService() {
		return scoreBoardService;
	}

	public void setScoreBoardService(ScoreBoardService scoreBoardService) {
		this.scoreBoardService = scoreBoardService;
	}

	@Test
	public void remark() {
		logger.debug("-= Begin test ScoreBoardServiceTest() =-");
	}

	@Test
	public void testFindScoreBoardByCommiteeAndTopicBeNotNull() {
		Person committee = new Person();
		committee.setId(3L);

		Topic topic = new Topic();
		topic.setId(1L);

		Person examiner = new Person();
		examiner.setId(2L);
		
		ScoreBoard scoreBoard = this.getScoreBoardService().findByCommiteeAndTopic(committee, topic,examiner);
		Assert.assertNotNull(scoreBoard);
	}

}
