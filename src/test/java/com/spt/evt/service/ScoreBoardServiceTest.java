package com.spt.evt.service;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.*;

import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;
import com.spt.evt.entity.ScoreBoard;
import com.spt.evt.entity.Topic;

import java.util.List;

/**
 * Created by : Anuchit Prasertsang Created Date : 28/10/2014
 */
public class ScoreBoardServiceTest extends AbstractTestService {
	private static final Logger LOGGER = LoggerFactory.getLogger(ScoreBoardServiceTest.class);

	@Autowired
	private ScoreBoardService scoreBoardService;
	@Autowired
	private RoomService roomService;

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
		
		ScoreBoard scoreBoard = scoreBoardService.findByRoomAndCommiteeAndTopicAndExaminer(room, committee, topic,examiner);
		Assert.assertNotNull(scoreBoard);
	}
	
	@Test
	public void testSaveScoreBoardShouldBeIdNotNull() throws Exception {
		Room room = new Room();
		room.setId(1L);
		
		Double score = 0.5;
		String comment = "Test Comment";
		
		Person committee = new Person();
		committee.setId(2L);

		Topic topic = new Topic();
		topic.setId(3L);

		Person examiner = new Person();
		examiner.setId(6L);
		
		ScoreBoard scoreBoardBefore = scoreBoardService.findByRoomAndCommiteeAndTopicAndExaminer(room, committee, topic, examiner);
		LOGGER.debug("scoreBoardBefore :{}",scoreBoardBefore);
		
		ScoreBoard scoreBoard = new ScoreBoard();
		scoreBoard.setRoom(room);
		scoreBoard.setCommittee(committee);
		scoreBoard.setTopic(topic);
		scoreBoard.setExaminer(examiner);
		scoreBoard.setScore(score);
		scoreBoard.setComment(comment);
		
		scoreBoardService.save(scoreBoard);
		Assert.assertNotNull(scoreBoard.getRoom());
		Assert.assertNotNull(scoreBoard.getId());					
		Assert.assertThat(scoreBoard.getComment(), is("Test Comment"));
		Assert.assertEquals(score, scoreBoard.getScore());
		
	}

	@Test
	public void testFindByRoomShouldBeNotNull() throws Exception {
		String status = "Completed";
		List<Room> rooms =   this.roomService.findByStatus(status);
		Room room = rooms.get(0);
		List<ScoreBoard> resultScoreBoard = this.scoreBoardService.findByRoom(room);
		Assert.assertNotNull(resultScoreBoard);
	}


}








