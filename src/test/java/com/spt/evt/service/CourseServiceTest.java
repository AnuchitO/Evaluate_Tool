package com.spt.evt.service;

import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.entity.Course;

/**
 * Created by : Anuchit Prasertsang Created Date : 28/10/2014
 */
public class CourseServiceTest extends AbstractTestService {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private CourseService courseService;

	public CourseService getCourseService() {
		return courseService;
	}

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	@Test
	public void remark() {
		logger.debug("-= Begin test CourseServiceTest() =-");
	}

	@Test
	public void testFindCourseByIdBeNotNull() {
		Course course = this.getCourseService().findById(1L);
		Assert.assertNotNull(course);
	}

}
