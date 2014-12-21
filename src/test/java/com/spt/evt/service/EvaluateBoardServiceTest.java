package com.spt.evt.service;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.*;

import org.json.JSONObject;
import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.annotation.JsonTypeInfo.As;
import com.spt.evt.entity.Person;
import com.spt.evt.entity.Room;
import com.spt.evt.entity.ScoreBoard;
import com.spt.evt.entity.Topic;

/**
 * Created by : Anuchit Prasertsang Created Date : 28/10/2014
 */
public class EvaluateBoardServiceTest extends AbstractTestService {
	public static final Logger LOGGER = LoggerFactory.getLogger(EvaluateBoardServiceTest.class);

	@Autowired
	private EvaluateBoardService committeeService;
	@Autowired
	private ScoreBoardService scoreBoardService;

	@Test
	public void testCourseInformationShouldBeJsonOfCourse() {
		Long roomId = 1L;
		Long examinerId = 2L;
		Long committeeId = 3L;
		Long courseId = 1L;
		JSONObject courseInformation = this.committeeService.getCourseInformation(roomId, examinerId, committeeId, courseId);
		Assert.assertTrue(courseInformation.has("subject"));
		Assert.assertTrue(0!=courseInformation.length());
	}

	@Test
	public void testScoring() throws Exception {
		Long roomId = 1L;
		Long examinerId= 2L;
		Long committeeId  = 3L;		
		Long topicId = 2L;
		Double score = 0.5;
		String comment = "Test Comment";
		String statusSave = this.committeeService.scoring(roomId, committeeId, examinerId, topicId, score, comment);
		Assert.assertThat(statusSave, is("Success"));
	}
	
	@Test
	public void testUpdateScoringShouldBeNewScore() throws Exception {
		Long roomId = 1L;
		Long examinerId= 2L;
		Long committeeId  = 3L;		
		Long topicId = 1L;
		Double score = 0.5;
		String comment = "Test Comment AA";
		
		String statusSave = this.committeeService.scoring(roomId, committeeId, examinerId, topicId, score, comment);
		Room room = new Room();
		room.setId(1L);
		
		Person committee = new Person();
		committee.setId(committeeId);

		Topic topic = new Topic();
		topic.setId(topicId);

		Person examiner = new Person();
		examiner.setId(examinerId);
		
		ScoreBoard scoreBoard = this.scoreBoardService.findByRoomAndCommiteeAndTopicAndExaminer(room, committee, topic, examiner);
		LOGGER.error("***************** scoreBoard [Score:{},Comment:{}]",scoreBoard.getScore(),scoreBoard.getComment());
		Assert.assertEquals(score, scoreBoard.getScore());
		Assert.assertEquals(comment, scoreBoard.getComment());
	}
	
	@Test
	public void testGetCourseNameByCourseIdShouldBeNotNull() {
		Long courseId = 1L;
		String courseName = this.committeeService.getCourseName(courseId);
		Assert.assertNotNull(courseName);
	}

    @Test
    public void testGetUserWithRequestCommitteeShouldBeRoomId1(){
        Long roomId=1L;
        JSONObject userWithRequestCommittee=this.committeeService.getUserWithRequestCommittee(roomId);
        Assert.assertTrue(userWithRequestCommittee.has("allUserWithRequestCommittee"));
        Assert.assertTrue(userWithRequestCommittee.has("countWait"));
        Assert.assertTrue(userWithRequestCommittee.length()!=0);
        Assert.assertNotNull(userWithRequestCommittee.getJSONArray("allUserWithRequestCommittee"));
    }

    @Test
    public void testFindParticipantIdShouldBeRoomId1AndPersonId1(){
        Long roomId=1L;
        Long personId=1L;
        Long participantId=this.committeeService.findParticipantId(roomId,personId);
        Assert.assertNotNull(participantId);
        Assert.assertEquals(new Long(4),participantId);
    }

    @Test
    public void testGetAllPersonToApproveShouldBeRoomId2(){
        Long roomId=2L;
        JSONObject getAllPersonToApprove=this.committeeService.getallPersonToApprove(roomId);
        Assert.assertTrue(getAllPersonToApprove.has("person"));
        Assert.assertTrue(getAllPersonToApprove.length()!=0);
        Assert.assertNotNull(getAllPersonToApprove.getJSONArray("person"));
    }
}
