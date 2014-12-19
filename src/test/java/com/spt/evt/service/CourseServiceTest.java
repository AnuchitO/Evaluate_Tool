package com.spt.evt.service;

import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.entity.Course;

import org.json.JSONObject;

/**
 * Created by : Anuchit Prasertsang Created Date : 28/10/2014
 */
public class CourseServiceTest extends AbstractTestService {
	public static final Logger LOGGER = LoggerFactory.getLogger(CourseServiceTest.class);

	@Autowired
	private CourseService courseService;

	@Test
	public void testFindCourseByIdBeNotNull() {
		Course course = this.courseService.findById(1L);
		Assert.assertNotNull(course);
	}

	@Test
	public void testgetAllCourseShouldBeJsonObject() throws Exception {
		JSONObject result = this.courseService.getAllCourse();
		LOGGER.debug(" ",result.toString());
		Assert.assertTrue(result.has("report"));
	}

}
