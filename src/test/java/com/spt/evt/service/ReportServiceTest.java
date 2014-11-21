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

/**
 * Created by : Anuchit Prasertsang Created Date : 28/10/2014
 */
public class ReportServiceTest extends AbstractTestService {
	private static final Logger LOGGER = LoggerFactory.getLogger(ReportServiceTest.class);

	@Autowired
	private ReportService reportService;

	@Test
	public void testFindByStatusShouldBeNotNull() {
		JSONObject roomInformation = this.reportService.findByStatus();
		Assert.assertTrue(roomInformation.has("room"));
		Assert.assertNotNull(roomInformation);
	}
	
}
