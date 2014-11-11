package com.spt.evt.dao;

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
 * Created by : Anuchit Prasertsang Created Date : 27/10/2014
 */
public class ScoreBoardDaoTest extends AbstractTestDao {
	private static final Logger LOGGER = LoggerFactory.getLogger(RoomDaoTest.class);

	@Autowired
	private ScoreBoardDao scoreBoardDao;
	@Autowired
	private MemberRegisterDao memberRegisterDao;

	@Test
	public void testFindScoreBoardByCommiteeAndTopicBeNotNull() {
		Person committee = new Person();
		committee.setId(3L);

		Topic topic = new Topic();
		topic.setId(1L);

		Person examiner = new Person();
		examiner.setId(2L);

		ScoreBoard scoreBoard = scoreBoardDao
				.findByCommiteeAndTopicAndExaminer(committee, topic, examiner);
		Assert.assertNotNull(scoreBoard);
	}

	@Test
	public void testSave() {
		//		Double score = 0.4;
		//		String comment = "Test Comment";
		//		Long committeeId = 3L;
		//		Long examinerId = 2L;
		//		Long topicId = 3L;
		//		
		//		
		//		Person committee = new Person();
		//		committee.setId(committeeId);
		//
		//		Topic topic = new Topic();
		//		topic.setId(topicId);
		//
		//		Person examiner = new Person();
		//		examiner.setId(examinerId);
		//
		//		
		//		ScoreBoard scoreBoard = new ScoreBoard();
		//
		//		scoreBoard.setCommittee(committee);
		//		scoreBoard.setTopic(topic);
		//		scoreBoard.setExaminer(examiner);
		//
		//		scoreBoard.setScore(score);
		//		scoreBoard.setComment(comment);
		//
		//		scoreBoardDao.save(scoreBoard);
		//		
		//		
		//		ScoreBoard scoreBoardBefore = scoreBoardDao.findByCommiteeAndTopicAndExaminer(committee, topic, examiner);
		//		logger.debug("***********************scoreBoard :{}",scoreBoardBefore);
		//		Assert.assertNotNull(scoreBoardBefore);
		//
		//
		//
	}

}
