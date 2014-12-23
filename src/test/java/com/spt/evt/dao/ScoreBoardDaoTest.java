package com.spt.evt.dao;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.*;

import com.spt.evt.service.TopicService;
import org.json.JSONObject;
import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;
import com.spt.evt.entity.ScoreBoard;
import com.spt.evt.entity.Topic;

import com.spt.evt.service.PersonService;
import com.spt.evt.service.RoomService;

import java.util.List;

/**
 * Created by : Anuchit Prasertsang Created Date : 27/10/2014
 */
public class ScoreBoardDaoTest extends AbstractTestDao {
	private static final Logger LOGGER = LoggerFactory.getLogger(ScoreBoardDaoTest.class);

	@Autowired
	private ScoreBoardDao scoreBoardDao;
	@Autowired
	private MemberRegisterDao memberRegisterDao;
	@Autowired
	private RoomDao roomDao;
	@Autowired
	private RoomService roomService;
	@Autowired
	private PersonService personService;
	@Autowired
	private TopicService topicService;



	@Test
	public void testFindScoreBoardByCommiteeAndTopicBeNotNull() {
		Room room = new Room();
		room.setId(1L);
		
		Person committee = new Person();
		committee.setId(2L);

		Topic topic = new Topic();
		topic.setId(1L);

		Person examiner = new Person();
		examiner.setId(6L);

		ScoreBoard scoreBoard = scoreBoardDao
				.findByRoomAndCommiteeAndTopicAndExaminer(room, committee, topic, examiner);
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

	@Test
	public void testFindByRoom() {
		String status = "Completed";
		List<Room> rooms = this.roomDao.findByStatus(status);
		Room room = rooms.get(0);
		List<ScoreBoard> resultScoreBoard = this.scoreBoardDao.findByRoom(room);
		Assert.assertNotNull(resultScoreBoard);
	}


	@Test
	public void testFindByRoomAndTopicAndExaminerShoudBe() {
		Long roomId = 1L;
		Long examinerId = 6L;
		Long topicId = 58L;

		Room room			= this.roomService.findById(roomId);
		Person examiner 	= this.personService.findById(examinerId);

		Topic topic = this.topicService.findById(topicId);


		List<ScoreBoard> resultScoreBoard = (List<ScoreBoard>) this.scoreBoardDao.findByRoomAndTopicAndExaminer(room,topic,examiner);
		Assert.assertNotNull(resultScoreBoard);
	}

	@Test
	public void findByRoomAndTopicAndExaminer(){
		Room room = new Room();
		room.setId(1L);
		Topic topic = new Topic();
		topic.setId(1L);
		Person examiner = new Person();
		examiner.setId(6L);

		List<ScoreBoard> scoreBoard = scoreBoardDao.findByRoomAndTopicAndExaminer(room, topic, examiner);
//		LOGGER.debug("====================:: "+scoreBoard);
		Assert.assertNotNull(scoreBoard);
	}

}
