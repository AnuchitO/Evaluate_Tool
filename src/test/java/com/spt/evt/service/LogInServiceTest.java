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
public class LogInServiceTest extends AbstractTestService {
	public static final Logger LOGGER = LoggerFactory.getLogger(LogInServiceTest.class);

	@Autowired
	private LogInService logInService;

	@Test
	public void testUserNamePasswordShouldBeJsonOfRoom() {
		String userName = "suriya_e";
		String password = "suriya_e";
		JSONObject personInformation = this.logInService.checkUserNamePassword(userName, password);
		LOGGER.error("*****************&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&******* ");
		LOGGER.error("************************ {}",personInformation.toString());
		Assert.assertTrue(personInformation.has("id"));
		Assert.assertNotNull(personInformation);
	}

}
