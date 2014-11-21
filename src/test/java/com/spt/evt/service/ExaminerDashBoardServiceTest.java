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
public class ExaminerDashBoardServiceTest extends AbstractTestService {
	public static final Logger LOGGER = LoggerFactory.getLogger(ExaminerDashBoardServiceTest.class);

	@Autowired
	private ExaminerDashBoardService examinerDashBoardService;

	@Test
	public void testCourseInformationShouldBeJsonOfCourse() {
		Long roomId = 1L;
		Long examinerId = 2L;
		Long committeeId = 3L;
		Long courseId = 1L;
		JSONObject courseInformation = this.examinerDashBoardService.getCourseInformation(courseId);
		LOGGER.error("*****************&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&******* ");
		LOGGER.error("************************ {}",courseInformation.toString());
		Assert.assertTrue(courseInformation.has("subject"));
		Assert.assertTrue(0!=courseInformation.length());
	}

}
