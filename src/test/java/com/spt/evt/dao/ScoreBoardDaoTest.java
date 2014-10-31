package com.spt.evt.dao;

import static org.hamcrest.core.Is.is;

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
	@Autowired
	private MemberRegisterDao memberRegisterDao;

	public MemberRegisterDao getMemberRegisterDao() {
		return memberRegisterDao;
	}

	public void setMemberRegisterDao(MemberRegisterDao memberRegisterDao) {
		this.memberRegisterDao = memberRegisterDao;
	}

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

		ScoreBoard scoreBoard = this.getScoreBoardDao()
				.findByCommiteeAndTopicAndExaminer(committee, topic, examiner);
		Assert.assertNotNull(scoreBoard);
	}

	@Test
	public void testSave() throws Exception {
		Double score = 0.8;
		String comment = "Test Comment";
		Long committeeId = 3L;
		Long examinerId = 2L;
		Long topicId = 3L;

		Person committee = new Person();
		committee.setId(committeeId);

		Topic topic = new Topic();
		topic.setId(topicId);

		Person examiner = new Person();
		examiner.setId(examinerId);

		ScoreBoard scoreBoardBefore = this.getScoreBoardDao().findByCommiteeAndTopicAndExaminer(committee, topic, examiner);
		Assert.assertNull(scoreBoardBefore);

		ScoreBoard scoreBoard = new ScoreBoard();

		scoreBoard.setCommittee(committee);
		scoreBoard.setTopic(topic);
		scoreBoard.setExaminer(examiner);

		scoreBoard.setScore(score);
		scoreBoard.setComment(comment);

		this.getScoreBoardDao().save(scoreBoard);
		Assert.assertNotNull(scoreBoard.getId());
		Assert.assertThat(scoreBoard.getComment().toString(),
				is("Test Comment"));
		Assert.assertEquals(score, scoreBoard.getScore());

	}

}
