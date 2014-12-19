package com.spt.evt.service;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.*;

import org.json.JSONObject;
import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by : Anuchit Prasertsang Created Date : 28/10/2014
 */
public class ExaminationRoomServiceTest extends AbstractTestService {
	public static final Logger LOGGER = LoggerFactory.getLogger(ExaminationRoomServiceTest.class);

	@Autowired
	private ExaminationRoomService examinationService;

	@Test
	public void testRoomInformationShouldBeJsonOfRoom() {

		JSONObject roomInformation = this.examinationService.getRoomInformation();
		LOGGER.error("*****************&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&******* ");
		LOGGER.error("************************ {}",roomInformation.toString());
		Assert.assertTrue(roomInformation.has("room"));
		Assert.assertNotNull(roomInformation);
	}

	@Test
	public void testPersonInRoomInformationShouldBeJsonOfPersonInRoom() throws Exception {
		Long roomId = 1L;
		Long examinerId= 2L;
		Long committeeId  = 3L;
		Long modulatorId = 2L;
		JSONObject personInRoomInformation = this.examinationService.getPersonInRoomInformation(roomId, examinerId, committeeId, modulatorId);
		Assert.assertTrue(personInRoomInformation.has("idRoom"));
		Assert.assertTrue(0!=personInRoomInformation.length());
	}



}
