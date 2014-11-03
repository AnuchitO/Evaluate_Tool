package com.spt.evt.service;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.*;

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

//	public ScoreBoardService getScoreBoardService() {
//		return scoreBoardService;
//	}
//
//	public void setScoreBoardService(ScoreBoardService scoreBoardService) {
//		this.scoreBoardService = scoreBoardService;
//	}

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
		
		ScoreBoard scoreBoard = scoreBoardService.findByCommiteeAndTopicAndExaminer(committee, topic,examiner);
		Assert.assertNotNull(scoreBoard);
	}
	
	@Test
	public void testSaveScoreBoardShouldBeIdNotNull() throws Exception {
		Double score = 0.5;
		String comment = "Test Comment";
		
		Person committee = new Person();
		committee.setId(3L);

		Topic topic = new Topic();
		topic.setId(3L);

		Person examiner = new Person();
		examiner.setId(2L);
		
		ScoreBoard scoreBoardBefore = scoreBoardService.findByCommiteeAndTopicAndExaminer(committee, topic, examiner);
		logger.debug("scoreBoardBefore :{}",scoreBoardBefore);
		
		ScoreBoard scoreBoard = new ScoreBoard();
		scoreBoard.setCommittee(committee);
		scoreBoard.setTopic(topic);
		scoreBoard.setExaminer(examiner);
		scoreBoard.setScore(score);
		scoreBoard.setComment(comment);
		
		scoreBoardService.save(scoreBoard);
		
		Assert.assertNotNull(scoreBoard.getId());					
		Assert.assertThat(scoreBoard.getComment(), is("Test Comment"));
		Assert.assertEquals(score, scoreBoard.getScore());
		
	}
	

}
