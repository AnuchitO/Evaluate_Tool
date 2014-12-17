package com.spt.evt.service;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.*;

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

import java.util.List;
import java.util.Map;

/**
 * Created by : Anuchit Prasertsang Created Date : 28/10/2014
 */
public class ReportServiceTest extends AbstractTestService {
	private static final Logger LOGGER = LoggerFactory.getLogger(ReportServiceTest.class);

	@Autowired
	private ReportService reportService;
	@Autowired
	private RoomService roomService;
	@Autowired
	private PersonService personService;

	@Test
	public void testGetAllScoreShouldBeJsonObject() throws Exception {
		JSONObject result = this.reportService.getAllScore();
		LOGGER.debug(" ",result.toString());
		Assert.assertTrue(result.has("report"));
	}

	@Test
	public void testPrepareDataScoreBoardShouldBeMapScoreOfRoom() throws Exception {
		String status = "Completed";
		List<Room> rooms = this.roomService.findByStatus(status);
		Map<Room, Map<Topic, List<Double>>> scoreOfRoom = this.reportService.prepareDataScoreBoard(rooms);
		Map<Topic, List<Double>> scoreOfTopic = scoreOfRoom.get(rooms.get(0));
		for (Topic key:scoreOfTopic.keySet()) {
			List<Double> scoreList = scoreOfTopic.get(key);
			Assert.assertTrue(0!=scoreList.size());
			break;
		}
	}

	@Test
	public void testGetScoreByExaminerShouldBeJsonObject() {
		Person examiner = this.personService.findById(2L);
		JSONObject result = this.reportService.getScoreByExaminer(examiner);
		LOGGER.debug(" ",result.toString());
		Assert.assertTrue(result.has("report"));
	}

	@Test
	public void testgetAllExaminerCompletedShouldBeJsonObject() throws Exception {
		JSONObject result = this.reportService.getAllExaminerCompleted();
		LOGGER.debug(" ",result.toString());
		Assert.assertTrue(result.has("report"));
	}

}
