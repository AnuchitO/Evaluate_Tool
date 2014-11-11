package com.spt.evt.dao;

import org.junit.Assert;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spt.evt.entity.Course;

/**
 * Created by : Anuchit Prasertsang Created Date : 27/10/2014
 */
public class CourseDaoTest extends AbstractTestDao {
	private static final Logger LOGGER = LoggerFactory.getLogger(RoomDaoTest.class);

	@Autowired
	private CourseDao courseDao;

	@Test
	public void remark() {
		LOGGER.debug("/*** Begin test CourseDaoTest() ***/");
	}

	@Test
	public void testFindCourseByIdBeNotNull() {
		Course course = this.courseDao.findById(1L);
		Assert.assertNotNull(course);
	}

}
